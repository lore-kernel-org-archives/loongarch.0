Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795643;
	b=bx0TnmjYqUosWfkDUkq+gvmtTwd4DOGueqgBpsV80SMP2I4QduFynbi8QG71de2JHcfU
	 jU7urwUlWEWC4YE6+DCBOjm1KaBNSRqQIOHahsLO7fY21sFAkN18LGtR3v+cjOvCJ8wXF
	 Vl2mJJgVDg8cSiXAII2j0h2wuuG6riyfA/EfC20xr6PAB4DIPCa5caIAejc+XecrHu3Nc
	 /myfBPrF1Q1cm+3LhZMd7Ip7ZxTFKwYPY5Htkre+jMFawmV2aTIBdd9geoG/he0d66SdD
	 N1bnObWIBkDrPjG8DcX1BWCGbsMp+NRqxT2ot7yQXkl77MslpbZAQJp7W/k86GN4/5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795643;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gcXNMw2oPgK1R9HomlSBqdiHaOrMrqZQ5+yYMxjaNqk=;
	b=kA7Ld6Oek+WafuyUncmju/Sma4tMoC5VyvxJOga+o+b+mr79l9VyYoCmT+tUsGynFXVh
	 y1BPkGrFmbVucHY3HYE4bBkxJdH7PQLY/i2XvQano2xcrXH+p4j/MFTepxu1kU955PQAM
	 /ygAaQnJ0GYOKjw580iY4Ai/q5OaVgHyeV6rs4fKiTdkWG4h3/Y/2Lua1lw24h46oPERd
	 NAzRb/szSqBCfJ8e8Oym5jTcxn0f7OGw3DgFjRlgV2u4SivBuPNVZFHKYS1ZCHTNNDOMJ
	 8K18ZTwvSia9Fw7jgPcIPXtH/L6mSoTYaSJDfY9F82IHWZHo2n4nfwN8nYmQcv6rKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7R57Sne;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C5606A31C;
	Fri, 27 Nov 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7R57Sne
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659861F00897;
	Fri, 27 Nov 2026 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795643;
	bh=gcXNMw2oPgK1R9HomlSBqdiHaOrMrqZQ5+yYMxjaNqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7R57SneQOpPyR1/366nuSm4nwimDEP3GA6ZyDM+Cyvvub7eQ5Ic+U5abnYA5aUqm
	 2TH07W3KRY5Hmf4OcL6GGgtUpLV6iYvoM82pmlwWOkGs9NU8Amb7hHqgsO2rT3F1t8
	 RmVmujYy1aHZujChy5gR09uvftmCBimMqRHqyjASk8sN/Vej7hYcdUhGKV1KsrH0SE
	 yYV/5ZGnrZcePLgR5DItCbMk2s6WpFCrduZMm9RaSXk9wwEZuDh4uvMH6Opv3ewtoK
	 pAQj3J9xTUQNJorNMxY3YnBWdZtkAYuiiLDobSMuHxSsvIU0coRvae6aK0XBhQE9ca
	 Kd3qE31MfdqgQ==
Date: Fri, 27 Nov 2026 17:07:18 +0100
From: Thorsten Blum <blum@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/loongarch: laptop: Reject negative max
 brightness values
Message-ID: <awmqtjg_E3WCbbSA@kernel.org>
References: <20261127155507.805377-2-blum@kernel.org>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127155507.805377-2-blum@kernel.org>

+Cc linux-kernel@vger.kernel.org

On Fri, Nov 27, 2026 at 04:55:08PM +0100, Thorsten Blum wrote:
> laptop_backlight_register() uses the maximum brightness reported by the
> ECLL ACPI method without validating it. A negative result could cause
> the driver to register a backlight with an invalid brightness range.
> 
> Return -EINVAL for negative values before powering on and registering
> the backlight.
> 
> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
> Found by code inspection and compile-tested only.
> 
>  drivers/platform/loongarch/loongson-laptop.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
> index 4ec56621db24..d582eec765ef 100644
> --- a/drivers/platform/loongarch/loongson-laptop.c
> +++ b/drivers/platform/loongarch/loongson-laptop.c
> @@ -415,6 +415,11 @@ static int laptop_backlight_register(void)
>  	if (!acpi_evalf(hotkey_handle, &status, "ECLL", "d"))
>  		return -EIO;
>  
> +	if (status < 0) {
> +		pr_err("Invalid maximum brightness: %d\n", status);
> +		return -EINVAL;
> +	}
> +
>  	ret = ec_backlight_set_power(true);
>  	if (ret)
>  		return ret;
