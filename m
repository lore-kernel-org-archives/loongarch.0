Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482501A0B15
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764206301; cv=none; b=dJ1k+VoAgwi+F+rI0xBNRkkVTUHMegTn+L/G+erz2RuQf7icXqe0dLUikC+9sQjXzjUmLlQ60ce5C6zVq4InhAXRU2HDZDnsYdCg1uEfLXDYMEpaShsqBQiU8uQyx8DXsrht+1s6/RFT+9UXH7Et6XpAxOC+TLDGAIGMPsULMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764206301; c=relaxed/simple;
	bh=GQVRD0kDLnRr8PlGCc+5Hnmo5Omwya0ZZMgiPEA57KI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iah7HOvV9xbAmyCjEZ4DwYNU2zKzKALaohNZQ1715n4zKz/MkVOywUEIyho6rfkCiOHkRnD7RmP6vQZD83K9ch5QpAvdKCsEvgjl8cOHwjvdmSb37blCP+eEGcugZgtAyjgbs8jFL0a9+MnjrA+EBTXeEbwIj9HxMf+Dp/ZlUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FbIUaqZL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FbIUaqZL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so2465105e9.2
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 17:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764206298; x=1764811098; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
        b=FbIUaqZLkUAYVkKjjUlmnoCyQh2ZzbjaVU+tVGFDhpXJQL6kiYaVer5LBvpSb+k1oK
         rT4a466y89OVXtf7/L1M2So3IWraGmi8ogWHGUrFdWSbiPL3J7z1shqzt6OJi78avy4e
         QdDEscHx03mPlzHLMzgn7SyFhblVloiDKS6DZu6nOD9XEkr//4gYOVOjABF+7ObEsvsa
         WeH+vVSH6FV2F3ZJTkolSCim6IdmmKxfvh/Xz89ihdhf9dBhO60O0yFNshhQSfYLRE3C
         XA1Rpf/IEBoxC9yN6X0KGnJhLg7zUT7mMmIxoYfev2OVDi6HZeyofVnkgoJVXl1MiqJ+
         wHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206298; x=1764811098;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
        b=R0ecpel1MRq5ld57JlMhmZXn4fyErYA/lerDjNulKW9YqnD9cQCSwFCXgj35gR9gjr
         KhFX6JptNpu5oNFQTtfmFZQCmxmY1xjRjYsc234J/sE802j3/ipbPtoYE9l52LwYuGqX
         QfWOapg9bZQRosCquxtiWqrSYO5XIyWOkea4Y2AMaZntRUpJWV+DzZe5TiKcwI3FiRjA
         +NO03Yizo1uHt7JvsQydA51cABTK+7rNxo7SRHAA37pfpVFHEDJqQl3BF+ICgo4CFkS3
         CwCu8dgjMd8zL5lOh6Krkp45vjajbMYDYC0hrZuGlrgRttiBgYBqo5V7NTTb75Cp1QOk
         mkRw==
X-Forwarded-Encrypted: i=1; AJvYcCUNwvkhDHYoKoN1JzBnfxvz5y3GTa96msZfRQmt4vSGwjD7Wn16k5Lgm0aTkEVSyaZfTSmkZ4/FcSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsyrxWh2zzAemhNzFrINvatrELL11x50lNu8xixVwBPknNpTQ6
	/x1lDkHlDyN1eue9HY4POG7baJiF27zS0tzpEn5xhgAUyAdAFnY3lnaW4nw0D0tyswI=
X-Gm-Gg: ASbGncuUht5OkgvSUZduO7oWSAPKm7m9aSbe28CdYyVO77BChdFR7JH1n/CdgCMBcDn
	iny7JLS+/XB5glTsxinRes1uwzIc0Te2GEr886ngM+nTnBuNGcbcsO8C0KdKmHJZANzNMIArjVQ
	gMHMNaGFDBm+TsuEDvgrHHw3gkGaWBL1byPounSmeMOHxE/VhshtntO0qt4N8ORYoXUL17QY9JE
	JXmRyzXAKxtZ4IDD5ivLIih8rJlAh3H8HX8Erk16vlzOLJVspEhjbGoiBn9qCaSDryRcBGFN5y9
	USFrWGQd71vSFlMgiWqN7KgPsQ5hJwCDcM5xG2/SbhdwZL1mJGSzh5zpe3P7tD4yMffjlKeVMlu
	7jH9U4Y80hX5t79pZGXPOp5WsbaZRhfhit50zCOR6aADRI3dWuGFYaTVTdnVhM+WJDqEBDNW90S
	458l0bMMzvLjsmVz1q+bQgrW7ozswVe5SV
X-Google-Smtp-Source: AGHT+IHKRsRzIcI/YdpyjCx/e6RWPSP3syqAgwQHcfAEZoMWkqQomccWOuW4YSvp5SYEElJFnjRGrw==
X-Received: by 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47904b25e63mr87066215e9.30.1764206297510;
        Wed, 26 Nov 2025 17:18:17 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075ddsm207261215ad.3.2025.11.26.17.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 17:18:17 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 09:18:09 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/9] sysfb: Add struct sysfb_display_info
Message-ID: <aSem0a7jTfCNTdX-@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <20251126160854.553077-4-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-4-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)


Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Add struct sysfb_display_info to wrap display-related state. For now
> it contains only the screen's video mode. Later EDID will be added as
> well.
> 
> This struct will be helpful for passing display state to sysfb drivers
> or from the EFI stub library.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/linux/sysfb.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 8527a50a5290..8b37247528bf 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/screen_info.h>
>  #include <linux/types.h>
>  
>  #include <linux/platform_data/simplefb.h>
> @@ -60,6 +61,10 @@ struct efifb_dmi_info {
>  	int flags;
>  };
>  
> +struct sysfb_display_info {
> +	struct screen_info screen;
> +};
> +
>  #ifdef CONFIG_SYSFB
>  
>  void sysfb_disable(struct device *dev);
> -- 
> 2.51.1
> 
