Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3A199B9
	for <loongarch@lists.linux.dev>; Wed, 29 Nov 2023 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vC03LvyW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b4746ae3bso21530055e9.0
        for <loongarch@lists.linux.dev>; Wed, 29 Nov 2023 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701260666; x=1701865466; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7DhAOyUG1OiZLTShDdBTISkChDUaLTQfa0lLug1y7bI=;
        b=vC03LvyWT7elC7TTBWXUJqVQLUmIt/snXCcEHh1FcccUkiJPcVgcFOFOvDOTKIwsPU
         oXuI/GGmNZMRRPieqN2eAKsyKCK0e3LR88YjUpGcJRe5qk9+VoqZ70h8WsEGtO+Gvp14
         rA/2kE0IaaU9Zi9LPvkz+zKGd73yqPsSWcSafFykJyWQyo5ebtm0xxJNx25Jfrt5RIQq
         fo75v1PKB4S2Uc60x/mZ4sg9INBGzacGF7IYZByJ3ZPlmMlscXlxfEV7bke4U9Es/nIC
         zdGbbcfHRn4+tz7RazcZDVtX98IzYwF1nCWieYayBLqxO+QSw58NaaDzHiLM4LCp1pLG
         8ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701260666; x=1701865466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DhAOyUG1OiZLTShDdBTISkChDUaLTQfa0lLug1y7bI=;
        b=L5QaDZvFpv8ZTqWOnoBuqLQ7zuSZ5LGMMYnolKAP+uANqE5eQSwhjbVpKzJmugH4vG
         yGVkscPiHZ+I6H1XcB0wFbBePdA2J+IPi9KYfPbUQw7AiozhQk4JT5k8B/rucXvi4oTC
         0RA9qqVKU/GIFdUzntckUiIMeF19EBfkpaPpkyp6Yqt9GXlQ/f0cX/A1GOPUlT4SykoZ
         EgXWIqwhKb6TfU0l+io1cC8iME8ZloGTg+9uG5a4MponDCzF1nwzBOfxs3TyAvcq4lWe
         iQ9LMPkKFArS6zg8LI7m/Zta+iUYo1MNBGAeU+lsN3BzvoCCCtpMEGtBIXAEPcK91Qhm
         Me8Q==
X-Gm-Message-State: AOJu0YwzHaCC6IFu6u99Zxkq49LwoWiedE2m/xq/c1TVkZ/zSR5EgPJ+
	tHaVOiQzHTBgAT0Bjt6ts0s6+Q==
X-Google-Smtp-Source: AGHT+IGi5tloNSLI4LYd4vqe68E6k/29FUG8DWVdl04/cafVh13sVoXbDJkjOwjDMPoyZ/FGt9k0pg==
X-Received: by 2002:a05:600c:3548:b0:406:c6de:2bea with SMTP id i8-20020a05600c354800b00406c6de2beamr11526960wmq.17.1701260665422;
        Wed, 29 Nov 2023 04:24:25 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:38f1:13b7:9b7a:2d6b? ([2a05:6e02:1041:c10:38f1:13b7:9b7a:2d6b])
        by smtp.googlemail.com with ESMTPSA id d9-20020a05600c34c900b0040b2c195523sm2123151wmq.31.2023.11.29.04.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 04:24:25 -0800 (PST)
Message-ID: <ca107e23-9361-47f3-8292-d2350bc858a0@linaro.org>
Date: Wed, 29 Nov 2023 13:24:23 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] loongson2_thermal: Fix some issues
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>,
 WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1700817227.git.zhoubinbin@loongson.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <cover.1700817227.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2023 10:57, Binbin Zhou wrote:
> Hi all:
> 
> Some thermal-related DTBS_CHECK warnings and driver issues were found
> when trying to introduce the Loongson-2K DTS{I} for LoongArch.
> This patch series attempts to fix those warnings.
> 
> Thanks.
> 
> -----


Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

