#pragma once

#include <memory>

namespace AdExample
{
    class Ad
    {
    public:

        virtual void load() = 0;

        virtual ~Ad() = default;
    };

    std::shared_ptr<Ad> createAd();
}
