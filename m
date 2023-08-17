Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E514274
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 15:44:00 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b962c226ceso122048451fa.3
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692287038; x=1692891838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lp1IuZHqWfKCAVZooutFxjvYW2JldAzLdhi3fANGf+o=;
        b=Y7OkJ5kzfBR9aS1o3hbSjWBbpDhDfQvuOJAbLWMeHIdCvYVqIqsch4xPQi6nhKj1sW
         MyG2VLyh2d/VhqbZsXyum3ahPYS8bZD/3vhehfn8OxUL5vrX+3/9cMxCnE5qiSsgyDR/
         fShe46mhdY+NApZpcWsPqTIffnvlvkPtOI+jgn4rIt384WQhvhdi97ih/Ilt5JjDZtjs
         doYEk6M74dQhbXRqKo5cHgm5Sxala+iBlG/zi0HHIrvQSCxfxkgmFC1tMXvlzNgJkmoZ
         rUDnjo4tsPM/cqSjpRMFtA5WxE0YyMxathg7q3nRUgdWs7XXqmVaU3lpDCCDHWNMmo6U
         MjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287038; x=1692891838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp1IuZHqWfKCAVZooutFxjvYW2JldAzLdhi3fANGf+o=;
        b=QUbbTKOv4UTjgDzATkPvB8ypcLuAVt1icWP1JuYxtsjxKVYU+7LohwQ2+/SfDsjWSU
         oFbwWE/PyeqfOJkH7Q9rKzylyb30FFJt7s7anl+S2Ua9cnFQSSPn4R5eEOTgMzH5o86/
         ewpQmRHVZ51Eq7m2jM3dWp4j/QA2BKD5W1wc35JCn93axafmrkswESZdC/JpNE+CSVC1
         St7htE+lUFwSCuWSXWjOdn/yN11sUXHOf+7W0aeXpWTZ1cJSMM6h9tyMu4lx9KmTyMif
         /Cer2x9vZdxRs5dsZJ9tYaM47i9SCYKeZswTnDmAxxNnP2SY7DbEq4AYK2z73MApzKTi
         Iy7A==
X-Gm-Message-State: AOJu0YwB4I16GZ/fZ/dTPZsYsV7F6UjowvVzeBnyuPWuwWKTC8w3Ssi6
	KATQRJvCuaUOnFeF/jW9epFbjw==
X-Google-Smtp-Source: AGHT+IGo/MkOhuQ87pyBbC2n512LcvZgd8ip292GYtt+yin2/JuZNeICWXDi7cMjkYGQ4p2MIAoVng==
X-Received: by 2002:a2e:241a:0:b0:2b9:df53:4c2a with SMTP id k26-20020a2e241a000000b002b9df534c2amr4656731ljk.20.1692287038600;
        Thu, 17 Aug 2023 08:43:58 -0700 (PDT)
Received: from [192.168.69.115] (mek33-h02-176-184-23-56.dsl.sta.abo.bbox.fr. [176.184.23.56])
        by smtp.gmail.com with ESMTPSA id lj5-20020a170906f9c500b0098d2d219649sm10418014ejb.174.2023.08.17.08.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 08:43:57 -0700 (PDT)
Message-ID: <c608d62f-e3fe-1ead-b0a7-f935fea80702@linaro.org>
Date: Thu, 17 Aug 2023 17:43:56 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/4] arch/mips/configs/*_defconfig cleanup
Content-Language: en-US
To: Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230817115017.35663-1-twoerner@gmail.com>
 <20230817115017.35663-4-twoerner@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817115017.35663-4-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/8/23 13:50, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
> target").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   arch/mips/configs/ip22_defconfig        | 1 -
>   arch/mips/configs/malta_defconfig       | 1 -
>   arch/mips/configs/malta_kvm_defconfig   | 1 -
>   arch/mips/configs/maltaup_xpa_defconfig | 1 -
>   arch/mips/configs/rm200_defconfig       | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

