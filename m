Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752992EB876
	for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 23:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991663; cv=none; b=ZN9bwwYGd7/rcilWPH6/rc+1ZK5bZwkQaD3H8uqqxvoRbHMIQpzufaNlmEl1bL7xV/IaMXjf0Tzklm14iZe+ppokRU4VpEufJrGJSh11ZUnM+QlLHi2MVyFFAYPyW/2EOtFWNZaPsdsPECDnBzYtzSNqcb4h7O1E9z/idKZX4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991663; c=relaxed/simple;
	bh=TNhOm2+mPi4NYVbMtUGere0nf/f+uNkQNxC2/uwPVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBhJMeiOfHgYRMr5pYaxZfiXVV/mAd3JkfwQtMkVrKk/iiAdBZW4hZX3dTYRZMG8BqPqi3Btrn+7rtHalTk7pb0hEcb5dl3NlDGcBPBA20BpK5jGgKBji3XdWzk7lSGKJElcsD28G6wVKj5UTizVrj5XdLNDLx9mJTV0fRIlbWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhTEPIMd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhTEPIMd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7afc154e411so112098b3a.1
        for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 15:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991662; x=1763596462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpaElP4SSyxGWg0zUUZ3WOwjT1Hm+DZrZlFdZZBBlhY=;
        b=DhTEPIMdVB3PQIXg1CaeQ/kH5bZayYhXeUfPUfx8gFgeWhmlYU/eqV98HRfl7wYG9W
         DpgdopPi/mk0KnJDaJ9YoXM7O1zXUZiZozFo0Oq65umIiIXxzlzx2kgeM/mLQJrnj4e7
         0BhClryiv6MYem+o5PpudhMhgOdKrabXK+EGz6H8wzCDBDf+OUlcegsYxRmi2ieP3tiw
         CkbcPjckfAiEDncSos/5DpANicUc6N6SomFutRJOL5ULBra4xEIXfQEu3expyFzlSXEa
         PMTGbSaK/1WqGFANQgTFLvToYNrZP0PSArl7WnLHC8xBWGA9wNrfR5+ds15mwT80Qnh9
         8tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991662; x=1763596462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpaElP4SSyxGWg0zUUZ3WOwjT1Hm+DZrZlFdZZBBlhY=;
        b=hwa/WLDY1p3qxl3Swj/7Qrn0v+9YmQtP41sL9m4PBvJ1Iwoknde7z3McPB6CT2BsTd
         hkKRTOlgI2+ToItTJ0sZYgrRkH985Sr9M3BXszmz7ST3ZgHhSpVGgX2HI3RgxG0qVddX
         s2iB+dMCylNP1m/sDBFUpD/2NFZIJcc9f0qt8NI7GC43uqgfEm5ngXfXZPRZOuHVcKlN
         dK7zfsAs87bXBYMPXUqmqdDTAvrC0g1SQnlq2bvMw5LVJHi6L019l/CBhfYpT9OHCoMI
         UsoB+E7ONhV9cM3hxaZQCf5lvx8VL/fh7yo/wVDE4hs2h7qGTW66fI5ReR+k+kTjx3Sj
         6fsw==
X-Forwarded-Encrypted: i=1; AJvYcCU56uCiUqZgAnHGER/tv4L0hZxTCz/AK7MovBR9vn+MGJ0Ebip4ZhN6zO/9yOm1etHrVBHdpJJjTKo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyriZ4539xagHxuCk8olyHPDh/Yl3UXEiRUIrG3vJ9WiDounOGq
	Mf+RS4tsjVk9swsnqy1bTNtXHrX/gzSeaQ9qF6jF7mQOWhGU2DQop6vV
X-Gm-Gg: ASbGnctpUlJCLx61NunlSdkvCHd0nYbnCEP4iFpQW7953Kue19s0222rjrktPnaOqus
	ZvHQKtt09GRycNrdUDWOizKKU9q14V6X4kWaxLRxYab6PJSBez3s7jcLUf0NJyJUucyjDj/FH0i
	0NyKVC1qMYXPN5t0VcosDDv6BvZj1+3q5+J116TZ9W1YXTCp7AnY0jsmT/vd8wxVh6iQa+7Hr8t
	KkSrtZSsHoFzocDzVf9Otlz0BRFcGdJJoF7uqKmpYCI7SZVtpHDwqUuWtRPBzWEN3S7bUwGddYf
	1h+Wa18WrErw2mNlWdPWY/oKLkDsNaJJvqQSHD90FLs1hXZdxLFk6hYL1JbvpoI1BaS2ocOSIqo
	cdPcwlxMUZhb7cepeLruGx28ohIZLozj/wvre4sFRnF2+S1ikq/t6EgBT1qqCvvWCKbjJEf5t4B
	xJZEjrwqQ/Krh2/JEQNbBPCXk=
X-Google-Smtp-Source: AGHT+IF7PKzf4wmRkdlJ3ART/JVas17yQj7OdtVc/pskXFKFVjPEcGqQ4iNAzKkyOOk75HL3arI3zw==
X-Received: by 2002:aa7:8714:0:b0:7b8:1a40:c47 with SMTP id d2e1a72fcca58-7b81a4010bbmr3446982b3a.16.1762991661744;
        Wed, 12 Nov 2025 15:54:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772fa72sm200624b3a.55.2025.11.12.15.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:54:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:54:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: loongson,ls1x-wdt: Add
 ls2k0300-wdt compatible
Message-ID: <de06b5f8-1c57-4795-8ac1-8182be6175d1@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <a1f64f3d3816620b690aaff7b87162ba9e5b155f.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f64f3d3816620b690aaff7b87162ba9e5b155f.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:50PM +0800, Binbin Zhou wrote:
> Add "loongson,ls2k0300-wdt" compatible to the dt-schema document, which
> is similar to Loongson-1 watchdog, but with differences in some register
> offsets and bit definitions.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> index 81690d4b62a6..50a9b468c4a3 100644
> --- a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/watchdog/loongson,ls1x-wdt.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Loongson-1 Watchdog Timer
> +title: Loongson Watchdog Timer
>  
>  maintainers:
>    - Keguang Zhang <keguang.zhang@gmail.com>
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - loongson,ls1b-wdt
>        - loongson,ls1c-wdt
> +      - loongson,ls2k0300-wdt
>  
>    reg:
>      maxItems: 1
> -- 
> 2.47.3
> 
