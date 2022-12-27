Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45D6ADB
	for <loongarch@lists.linux.dev>; Tue, 27 Dec 2022 21:57:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="407027849"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="407027849"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 13:57:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="721609669"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="721609669"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2022 13:57:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pAHwj-000H8E-0y;
	Tue, 27 Dec 2022 23:57:17 +0200
Date: Tue, 27 Dec 2022 23:57:17 +0200
From: Andy Shevchenko <andy@kernel.org>
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
Subject: Re: [PATCH V8 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y6tqPenv3NBEl9qD@smile.fi.intel.com>
References: <cover.1671688961.git.zhoubinbin@loongson.cn>
 <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 23, 2022 at 05:00:51PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

...

> +static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> +			     struct i2c_msg *msg, bool stop)
> +{
> +	int ret;
> +	bool is_read = msg->flags & I2C_M_RD;
> +
> +	/* Contains steps to send start condition and address */
> +	ret = ls2x_i2c_start(priv, msg);
> +	if (!ret) {
> +		if (is_read)
> +			ret = ls2x_i2c_rx(priv, msg->buf, msg->len);
> +		else
> +			ret = ls2x_i2c_tx(priv, msg->buf, msg->len);
> +
> +		if (!ret && stop)
> +			ret = ls2x_i2c_stop(priv);
> +	}
> +
> +	if (ret == -ENXIO)
> +		ls2x_i2c_stop(priv);
> +	else if (ret < 0)
> +		ls2x_i2c_init(priv);
> +
> +	return ret;
> +}

Still this code is odd from reader's perspective. It's in particular not clear
if the stop can be called twice in a row. I recommend to split it to two
functions and then do something like

_read_one()
{
	ret = start();
	if (ret)
		goto _stop; // Do we really need this?

		ret = rx();
		if (ret)
			goto _stop; // Do we need this?

		/* By setting this call the stop */
		if (stop)
			ret = -ENXIO;

	out_send_stop:
		if (ret == ...)
			return _stop();
		// I don't like above, so this error checking/setting parts
		// also can be rethought and refactored accordingly

		return ret;
}


	if (is_read)
		ret = _read_one();
	else
		ret = _write_one();

	if (ret)
		_init();

	return ret;


-- 
With Best Regards,
Andy Shevchenko


