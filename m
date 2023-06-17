Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C97FA
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 02:13:33 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-39eab4bbe8aso774835b6e.1
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 19:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686968013; x=1689560013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxYuitFqIvS0CnwxYobRRZ7gkcdJC0qztOU8c4Ql2xk=;
        b=MCN4P3tGhTe6Teg1s5+vWt2MCJMA1PFXXo7QmKmyIfvc41G3eyaZaWoQJwZrO+bSKC
         ybXgjByJ9polH06APaJ/9IM0Z+xjRWS00OOs07pMmEnm5ZvglIxYHDRUOpSkLTImiYha
         O7R6LGP5Q8r+GjyXgM5eONmZQEJkVXUbSz/mCpcPM3GyrbaAjG8E4PmAUrx4XY3o1IEk
         Io0I6fkZUklymTX96xAWJVqA/nVaRq4LyxzWh6kNmCCxEB6HEZKrehvOifyFi6UBD9+1
         XPwvWRndKkD/D65GvyhR5KU2UuVFeKCVUAskZ/7rWg/B03WoBb167dUS9+P5VBMqk02+
         B5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686968013; x=1689560013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxYuitFqIvS0CnwxYobRRZ7gkcdJC0qztOU8c4Ql2xk=;
        b=SYZiN0lAur5QusAeTzuEemCspM2RvajvNid4qLAk5PSJp4bBFTOKym4XWM89lvKK49
         CcXuEw7QMnwi0fEwPctoK3DWhP4tkqeCgHEnTwhCWJre7ifkWzu+TccM6CBfwtT9vuJn
         F7VmLKb7lJC5fudk3j7yzbLrTf0OjIGjzcLXztaX8N6hkfEm/t2iSRa9P8946paPGJmX
         sKcld036rh/lpXkzdk31kuEungozfEETt2p9mydyBhvLTSpwG3e0gNUZpI8FnHwy76XM
         qByjkErOxSChS9+12Ahlt7PImmEqhju3Ezm66PZ0yQPRKkTl/OZGqi2IssprVbN16bte
         z1qA==
X-Gm-Message-State: AC+VfDwXaSq6xTzmLvZBmNknb+Zwa81c1ViyyoqZBs6QBqEav7LIA5u8
	STJijKDVTuDK9m6PMGoSx/8=
X-Google-Smtp-Source: ACHHUZ46K3QquPbC3X3+5wS2rqY3Yyf+Kk2zL71s9mf166xiL29XvJaNE1AqDQyHJCwoe9pp93ptjA==
X-Received: by 2002:a05:6808:1389:b0:38c:66d3:67c0 with SMTP id c9-20020a056808138900b0038c66d367c0mr4582180oiw.16.1686968012812;
        Fri, 16 Jun 2023 19:13:32 -0700 (PDT)
Received: from [0.0.0.0] (ec2-52-77-211-167.ap-southeast-1.compute.amazonaws.com. [52.77.211.167])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090ad50f00b0024e05b7ba8bsm1973026pju.25.2023.06.16.19.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 19:13:32 -0700 (PDT)
Message-ID: <03c3df36-203b-591e-c0bb-05bfde54be77@gmail.com>
Date: Sat, 17 Jun 2023 10:13:26 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V5 0/2] irqchip: loongson-eiointc: Add DT init support
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 zhoubinbin@loongson.cn
References: <cover.1683279769.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
In-Reply-To: <cover.1683279769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marc:

The dt-binding part of the patchset looks good now, do you have any more 
comments on the driver part?

Thanks.
Binbin

On 2023/5/5 17:46, Binbin Zhou wrote:
> Hi all:
>
> Add EIOINTC irqchip DT support, which is needed for Loongson chips
> that are DT-based and support EIOINTC, such as the Loongson-2K0500 chip.
>
> Thanks.
>
> ---
> V5:
> - patch(2/2)
>    - Rebased on top of latest loongarch-next(v6.3.0).
>
> V4:
> - patch(1/2)
>    - Simplify the definition of the reg attribute by declaring the entire
>      chip configuration space directly.
>
> V3:
> - patch(1/2)
>    - Drop quotes;
>    - Drop interrupt-names;
>    - Drop loongson,eio-num-vecs;
>    - SoC-based compatibles instead of version-based compatibles.
> - patch (2/2)
>    - irq_set_handler_data() is used to get parent irq form DTS;
>    - Set vec_count by judging compatibles.
>
> V2:
> - Add the dt-bindings file (1/2);
> - patch(2/2)
>    - Remove forgotten debugging messages;
>    - Change compatible string name to "loongson,eiointc-1.0".
>
> Binbin Zhou (2):
>    dt-bindings: interrupt-controller: Add Loongson EIOINTC
>    irqchip/loongson-eiointc: Add DT init support
>
>   .../loongson,eiointc.yaml                     |  59 ++++++++
>   drivers/irqchip/irq-loongson-eiointc.c        | 133 +++++++++++++-----
>   2 files changed, 157 insertions(+), 35 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
>
