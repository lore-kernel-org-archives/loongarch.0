Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1113C90D
	for <loongarch@lists.linux.dev>; Tue, 23 Apr 2024 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713887678; cv=none; b=H7VrqLEl+uoZHb9P/K5CUxLCnhBpyOzpalcT7Edgm5vYIQZnL2svoq9Am4SIZs23iAgGbuR0/rp7J7tt8CZm37nAsF4EN79QbErBiNlyUFxonAhq17EA1XprkdKd7ymfouqTDoQMFeQ4grEzGsbmev+8CkA4LeGkH2BXhhsXt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713887678; c=relaxed/simple;
	bh=zOrR4N6W5yEjumIJlaR4j9bXUXeISdNMznsMzpCn11U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZteC2e5kigcEh+/TpZc6hdEUHRXrtAnKikQGdT+T0xwYZu5w7vcw/Vwdc8ZCZMRBwdHzdYPBftrLynbBmHLvDDyZ6PHhN2yMUzkOelbRx+x81SEc6iGpGrKRPd2wivCFieQedoKujHGF9YAcAf32XZacQtZh3sqkKqa6rmAr1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTLASh1i; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTLASh1i"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41a442c9dcbso19305815e9.2
        for <loongarch@lists.linux.dev>; Tue, 23 Apr 2024 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713887675; x=1714492475; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CEYkFgPQbfSpwnnDo2x7Wyyhx+vsMBr1IYLJirdNPw=;
        b=oTLASh1iCgC0Kj1hZx8PVtek6ClElyXFFZr+n2sAp9VO+b/RbPkrZED9bS+i+wA0H5
         1jHeXf8FLbaWOPCsQK1IcS4fSoyajC9fXUW8OlL0Vb25bpgCg+C0x77gJ/8D2ZL4i8LH
         +AMhCC+Q0XR8eYKNjL9BOxS0nvqhba9Da/48YAwxZEJAXHBpdeDk+lLXpfF0V4fqCUcl
         GdlSvGxz18a61WVzNNXV+chbUXR3ioPF04EyhBojeaI17C5JRH8l0zSVCKazjnQ9R3Cf
         l7cEXHDdXWgE7S+k1IoRGJkDkOC5bBc7or43b/V28yh2mnt04EuPUsa3P4/4zNaiEmjf
         +hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713887675; x=1714492475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CEYkFgPQbfSpwnnDo2x7Wyyhx+vsMBr1IYLJirdNPw=;
        b=Oq5kcUGTRQ20ml1IvAcFm7Ze06obtG0dcsS4EfiEwTsOlf34BD+x7YatpMpAunVbjQ
         POC3kn42JRhf41erXsCPqAVpEPFjHx6vbzB6YwEqSpnT2VOxAz5IVQDy3WGiEkf5bgeW
         xVx0rsVM47S6sjU+WrDm68gLxOf/KIoHT6nK/wLzzzJatx6b+Iapl7JgTejGY5/pEbLo
         8aWUPxzGIfs91X2sbNZKR5zZHXSiDA8accTbN88/scOG/vxicMo9iYwx4AEoL3cMstiy
         QxR0zKl/WZJk06dSDUGnEQ5L4ipp6GTcegbIae8i22SVlYZxDe8X+L9x7fcqcsnmz2O9
         YDMw==
X-Forwarded-Encrypted: i=1; AJvYcCUoEaTRfxSovIhH90Xrkt13po0766VP+CzHOpD+2+MOxkUK8fa+vuu85bHDTKkSheMc8DmtIZZJNWAnWwZn+yexyakrFZLM56KB
X-Gm-Message-State: AOJu0YxnG/NH/yuS1MkNbxgMzbw1bDX8uikSrskHKs2n2JLDM7R7jvHY
	wQ1hHysqyZGn/CSmsBsWxcV3cLmFYHNlpjaqlJ073Gk0PcNxloY49qAr85lUBE0=
X-Google-Smtp-Source: AGHT+IE0M1tVNbSGH6P4H6A7BokfgioaPGrg79dTjBg1s3qdqWoF9FuBSbISRUuyZlebNkOM8fxysw==
X-Received: by 2002:a05:6000:e81:b0:346:c0f6:8b6 with SMTP id dz1-20020a0560000e8100b00346c0f608b6mr9421964wrb.32.1713887674930;
        Tue, 23 Apr 2024 08:54:34 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id y5-20020adfe6c5000000b003436cb45f7esm14854289wrm.90.2024.04.23.08.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 08:54:33 -0700 (PDT)
Message-ID: <d1bf86bc-b561-47c6-999d-fb5e3c99663e@linaro.org>
Date: Tue, 23 Apr 2024 17:54:33 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] thermal: loongson2: Add Loongson-2K0500 and
 Loongson-2K2000 thermal support
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 loongarch@lists.linux.dev
References: <cover.1713837379.git.zhoubinbin@loongson.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <cover.1713837379.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/04/2024 03:58, Binbin Zhou wrote:
> Hi all:
> 
> This patchset introduce the Loongson-2K0500 and Loongson-2K2000
> temperature sensors.
> 
> The temperature sensors of Loongson-2K series CPUs are similar, except
> that the temperature reading method of the Loongson-2K2000 is
> different.
> 
> Specifically, the temperature output register of the Loongson-2K2000 is
> defined in the chip configuration domain. We need to define it in dts
> and calculate it using different calculation methods.
> 
> Thanks.
> 
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

