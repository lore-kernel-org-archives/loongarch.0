Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94CB4C64
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 13:46:58 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id bb5so9610377qtb.11
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bk1cdWlqVhbhLyQ5Z0Zwm2RMGNfzdRPJPquTEkxwGHE=;
        b=eTE2CBBoY8P+wFvZ5WJ8YTjFt3XYrDBbVejGXLnQROjLeveblnjTK7tp6+x3PNeyLV
         nl+kC/51un8xz66tWMZFsOfn7l6JOXEdSX4noD/wVmTq59861M7563YIEj36/A4iytgT
         ypqFJKyPaNnb2jA4K2WKMjyYtXYpyyt1xiamShV7Q5mkqy1S1BW9QPCwNSudex4VdPoZ
         CL52impiIZL8J1vI2exlcidmRxw7MzWnn5lqSjfPCQE4wVjsYBd480CRrOukxCQyXq4v
         E0vdLe/zF54VtEl3O+iY22rgkC8XMpaOgZEC904aXAvLSRiPQqIc+h/Xlx2488hMYKmA
         AMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk1cdWlqVhbhLyQ5Z0Zwm2RMGNfzdRPJPquTEkxwGHE=;
        b=N5VRRySoiCVdps9kDRaEnQlBZ0BKM0NILQg7/AJHBykOhyO74e2wiqUWYD377DQ2CK
         nnBfeu4ZKj/d1t7kCW8pQ/AsAzl9W1XMj2JZKmtKOq1twwNCRLstKk4SSY8AHCqPfVc6
         rFtwxibRQTj4oJsxWMNkIuMVnAaDGAs4l5MzvF0EMs2A8Qlqx57wuRlhip4QCFLe28qe
         eyc1tJRBYJhCvLkJaeBe6NWJVWFGN4AMpUByqRYOfdVYrsC2IvFGzsxsot312bKVNXRy
         kxgvuSqA3uVC/uxvTjzpHSon0+fzWjn0AGzkFPkRxDz3FJG7MUCjXSXhidny+vZ0tXrf
         geCA==
X-Gm-Message-State: ACrzQf1HDJvQYYLKEnu/BFeFrE4wAmU8p+FIaaoG6WigLrMHn5Z+Mcb8
	DAzilsi1hUhZ4wpdNTP4AbaKjA==
X-Google-Smtp-Source: AMsMyM6WvkWA2L2ll4WKjb1TisgOdDzT0tIlfPlXDDEbaY+sefp3eDrCawcJJSviK5xy4qL9wXJecQ==
X-Received: by 2002:a05:622a:164b:b0:39c:ec98:a13 with SMTP id y11-20020a05622a164b00b0039cec980a13mr2131165qtj.339.1666100817866;
        Tue, 18 Oct 2022 06:46:57 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id s23-20020a05622a1a9700b003988b3d5280sm2027602qtc.70.2022.10.18.06.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:46:57 -0700 (PDT)
Message-ID: <eb670850-6e97-df7b-cb62-1513f877956a@linaro.org>
Date: Tue, 18 Oct 2022 09:46:55 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 1/3] clk: loongson2: add clock dt-bindings include file
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221018130531.301-1-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221018130531.301-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2022 09:05, Yinbo Zhu wrote:
> This file defines all loongson2 soc clock indexes, it should be
> included in the device tree in which there's device using the
> clocks.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  MAINTAINERS                                 |  6 +++++
>  include/dt-bindings/clock/loongson2-clock.h | 29 +++++++++++++++++++++

Use subject prefixes matching the subsystem (git log --oneline -- ...).

These are bindings.

>  2 files changed, 35 insertions(+)
>  create mode 100644 include/dt-bindings/clock/loongson2-clock.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a162b6fba6fe..3db469f51d74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11914,6 +11914,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
>  F:	drivers/clocksource/loongson2_hpet.c
>  
> +LOONGSON2 SOC SERIES CLOCK DRIVER
> +M:	Yinbo Zhu <zhuyinbo@loongson.cn>
> +L:	linux-clk@vger.kernel.org
> +S:	Maintained
> +F:	include/dt-bindings/clock/loongson2-clock.h
> +
>  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>  M:	Sathya Prakash <sathya.prakash@broadcom.com>
>  M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
> diff --git a/include/dt-bindings/clock/loongson2-clock.h b/include/dt-bindings/clock/loongson2-clock.h
> new file mode 100644
> index 000000000000..23806408fe49
> --- /dev/null
> +++ b/include/dt-bindings/clock/loongson2-clock.h

Filename matching the compatible, so:
loongson,ls2k-clk.h

> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Dual license, like bindings, unless you are not allowed.

> +/*
> + * Author: Yinbo Zhu <zhuyinbo@loongson.cn>
> + * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
> +#define __DT_BINDINGS_CLOCK_LOONGSON2_H
> +
> +#define	LOONGSON2_REFCLK_100M				0

Drop weird indentation after define.


Best regards,
Krzysztof

