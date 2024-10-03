Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95519CC04
	for <loongarch@lists.linux.dev>; Thu,  3 Oct 2024 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966995; cv=none; b=Cmxl4uHsYoQ+gMJf8uOCUkhKs0l7cAv+oQhBS8TWvnK5h8QWYSz3MoQTYizD7BAaJINHgRsuGb8JKn9Ol1dL7xyJyxmXRhcqWrnR3tw18p8c9xKg6hiQ4PvDT9duEvynkPUsMcoolkGT/CJklhqUh/2OVI0s1FRGwToqJJ1KlZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966995; c=relaxed/simple;
	bh=YSJKGbAVsaG9FB5YYybhcFMUlGKkb5YfLZFQUI0JNHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErN1fUJSgBCljlOh/R+Y4AkQ0XsVH3emuczPYUD7m6reSZgo6w37bH8ZgmZNtabp/eyfXhrE7zLwtjFnjauErINp/g25vqpqYTMbL/7bpkGYsFWBovY7P9b5iqBOe8mDZuDri9keE2/S0VighYz9+YIVzYQiwUt+sc7l1P03FRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jaeuHWQX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jaeuHWQX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b78ee6298so6377615ad.2
        for <loongarch@lists.linux.dev>; Thu, 03 Oct 2024 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727966993; x=1728571793; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdndKVp/SXRSmiqlbx9yFx2IrKrWcsly5j+I0V4+Xpc=;
        b=jaeuHWQXgn/Qp9lq+fpKX8OaeWe61mxG87eb1b5LDtkCf64xWkG6SS79K2pZTInWDk
         DSR3c2kfz/P4ZGobDXfpjD1fBPckUu+0QRzWZlg/3pYyGLCfK4/vetABSvRjUtB2aP1k
         /ccOvgAhkD9GPYeyOErXlagllwoROP5uNToWkN1Ww1WaFpyH4qjDithsiJLHj12oXkHJ
         bUPsLgZ2GLB1XUHjLq5feHBQPnTZJYZVApaD9kCWPUll8jUiL5bkwD4HHz3yN1Ux2ALt
         Q6ErvnMtm1dnhuErpP6Isjm318MMpDhFcelzrlW4cJ6zB+Govw3l3InDZCQYjddtYa7C
         IC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727966993; x=1728571793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdndKVp/SXRSmiqlbx9yFx2IrKrWcsly5j+I0V4+Xpc=;
        b=HscLcLxBVqebOvuuafJZolz/eSjE+R705oP10E3H4UfRMEnCh5WxALSyenGCK+0arA
         X7X5PWuUFiKqkRAwfelcwlL+QF82MH+XIXCi1UaguH5wEAb/Va5SaS5iTzxWDvXSKAz2
         yaV1CII+jLrhfOlGkP4cqjS/UiK7q/cWptyZn27tcOdr/2W46wCdlQGoLBO+NhmMWNhh
         c4Gc+Sb0siDJnSOhGx/DPNthfN5s27yL2doNHZFCoXex4gdyr8wpG2mUjuQ2y7MX04dg
         +Z5UVBrflGuYZHYqwa8tDGDY/Ag8fhfaTrzhp/CH9rdF5o832earx2TL8vn8aHWnCAUo
         PPnA==
X-Forwarded-Encrypted: i=1; AJvYcCVffHySi1nebmZvoE3i6UQmH2k5RW7YIXcKjupXvLlkMGJTecepEyYBkYgzyvMubFC7v32kkE/dw1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSm4UP1AI6r8I9z0s/0hAsbNIFmXlrgCbt00pkn5i15MCPe3j8
	shSxvuEWtNUKyNPrv2afNFUQar2X2NmIsNMI4pneWe1XMctDZIB6uhMa1pxBXG0=
X-Google-Smtp-Source: AGHT+IGo1/5wmvT+S3lgxo2dZaET0mITukuMWSSrKrQoA9kwkNrpn/E6uNgdsnyYgFqETska12PKbQ==
X-Received: by 2002:a17:903:1105:b0:20b:b455:eb72 with SMTP id d9443c01a7336-20bc59f0768mr101644085ad.8.1727966993424;
        Thu, 03 Oct 2024 07:49:53 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beeee42f6sm9722015ad.123.2024.10.03.07.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 07:49:52 -0700 (PDT)
Message-ID: <238ace80-c5b4-4c8c-bcd9-8a06f99a3aa7@linaro.org>
Date: Thu, 3 Oct 2024 07:49:50 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] parisc: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 Yann Sionneau <ysionneau@kalrayinc.com>
References: <20240930132321.2785718-1-jvetter@kalrayinc.com>
 <20240930132321.2785718-8-jvetter@kalrayinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240930132321.2785718-8-jvetter@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/24 06:23, Julian Vetter wrote:
> -void memset_io(volatile void __iomem *addr, unsigned char val, int count)
> +void memset_io(volatile void __iomem *addr, int val, size_t count)
>   {
>   	u32 val32 = (val << 24) | (val << 16) | (val << 8) | val;

Mask of val now required.


r~
