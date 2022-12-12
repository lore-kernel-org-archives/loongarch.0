Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C41FDA
	for <loongarch@lists.linux.dev>; Mon, 12 Dec 2022 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670838047; x=1702374047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qTWDV+Z/hhFb8cx57UqTTsPxzQP16q2k1qLosYDy8aM=;
  b=T2QmB0/ODrBe9ieTLDijc3dfI348xUm5M/EZlVyE9V2Nkcyo8Czh+DSw
   tz81foiyuAFtqKYxzeiwCOHaOsw/LIQr05/65s1VUWnuQO1Q09mSpdnVi
   5/bob6q55YnaOftNBDojrtPJD0B5Kt+7uuAsKgXGAIEZT7rU9rIJr1fpX
   D4UidYZoZEZ92XHI08KxEOMRWBJiLln/YfqbL4HDSkp8iYSZ7ik0d/q4g
   nXhYimDk1nxUV6QUU3ngjXAlFFZlWmJkbCewSJ60Gf1QE7NVi94Zko5w4
   nOq5t7DGKSBErEhSD9PJpI1Bj1s9yxr/9jrx6tMO45EO9SPBZ/Yg6GD26
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="404069034"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="404069034"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 01:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="711612985"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="711612985"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2022 01:40:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p4fIf-008PDA-0p;
	Mon, 12 Dec 2022 11:40:41 +0200
Date: Mon, 12 Dec 2022 11:40:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V5 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y5b3GHiYxblLitvG@smile.fi.intel.com>
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <0a8a1dec27beea61935adb2a9c2d74e41c86e9b1.1670293176.git.zhoubinbin@loongson.cn>
 <Y49cL9JQ6kFblLeX@smile.fi.intel.com>
 <14dcf7b0-2fb1-575f-7e41-f58ce55b920b@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14dcf7b0-2fb1-575f-7e41-f58ce55b920b@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 07, 2022 at 03:10:43PM +0800, Binbin Zhou wrote:
> 在 2022/12/6 23:13, Andy Shevchenko 写道:
> > On Tue, Dec 06, 2022 at 11:16:54AM +0800, Binbin Zhou wrote:

...

> > > -#include <linux/of.h>
> > Cool, but don't you need to add property.h?
> 
> Get it, I should have been more careful, maybe I'm still not very sensitive
> to header files.
> 
> Now I'm still basically judging based on whether I compile with errors or
> not.

You can generate the include tree by running `make includecheck`

The rule of thumb is to include what you are the direct user of.
With a few exceptions where we have the guarantees that one header
is always included by another (e.g. bits.h included by bitops.h).

> > Otherwise looks good to me.

-- 
With Best Regards,
Andy Shevchenko


