Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5445F28F5
	for <loongarch@lists.linux.dev>; Fri, 25 Nov 2022 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669371827; x=1700907827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaiiZneNmh9uPlFJaZlbiTDiqB5tAEB90ztrbXmYIrQ=;
  b=TY9thoyNKkzSrAIOVAOB8JGGxKv/Uq5DqPxAhzUzUEo+1XWXygTHrm4p
   Rcu1U5UxRTYlYAhQj/jACMkkJBAl5MUxJ6P+/rdrn3CJcz0Z0MaaRq6eM
   RKlL4vGH26E06gl17zX8l5DsHNA2pP76VoBSBES6n4m8bQ2kJx54TAO0o
   O/5233HEpss4pYNYYwwLpI7iAP8cIX4Z4ZrWbg+8JJcRM8CLsUrHtr0gP
   jK9zIjfQ9fLVYMwSYbR0Eiug+73SrdaeUXUvy1iFruYmhpj/oPJ+H3zzA
   bOMY4s6GbhKi1TbUNpcU9U4u/NqH/+ebOhA/PnoY6/zo9T5fxu30grFpO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="294839968"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="294839968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 02:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="636535062"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="636535062"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2022 02:23:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oyVrw-00HBbq-2Q;
	Fri, 25 Nov 2022 12:23:40 +0200
Date: Fri, 25 Nov 2022 12:23:40 +0200
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
Subject: Re: [PATCH V3 2/5] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y4CXrDh61D/f8V2A@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <e0ed6dfa3dbf60b58ef4eaeb40ea46d2577a2834.1669359515.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0ed6dfa3dbf60b58ef4eaeb40ea46d2577a2834.1669359515.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 25, 2022 at 04:54:12PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration, so that the driver
> can be also enabled through ACPI table.

...

> +/* get i2c-gpio props from DT or ACPI table */

Get

...

> -	if (np) {
> -		of_i2c_gpio_get_props(np, pdata);
> +	if (np || has_acpi_companion(dev)) {
> +		i2c_gpio_get_props(dev, pdata);

	if (dev_fwnode() {
		i2c_gpio_get_props(dev, pdata);

...

> +	{"LOON0005", 0}, /*LoongArch*/

", 0" part is redundant. Also missing spaces in the comment.

-- 
With Best Regards,
Andy Shevchenko


