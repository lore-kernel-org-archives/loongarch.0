Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7633923A3
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 11:43:07 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id e15so3861931qvo.4
        for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pa4o10V2uYugUVoKqq6yjjDg+mNOr/BQAbRwWBsPRtM=;
        b=JX5M/+/2HWQ10e3W0WLl6CWzXoXlie2tjB4pKMvJdcii+roJFGtinwIaklhaF6DUKG
         OtSpXZg6xjI5Hpvsu3ORDq4Zetq4sDRcnd3G4GMJY0Y7YH1MCPx6YRwYrg4f6k4NejnF
         FJRWrWznSuAuIbRVkpImnS2kfGrAoLFtFeZonvM0hrOGVGQNcmb8+N2p+Uhfq9cP0VeC
         23his/m8b4sUZUqewSRIGGC3/A0+ixueVylCLnWZvFQb4rvpKLC6J3OrC7okwU/IIfxY
         cE48yUVCtlF0HhCUeuiiN4YP87VEqgKai3EO3eU9Lw3YiaZH4/v+hrc8M8yHTVYxsRxT
         Xwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pa4o10V2uYugUVoKqq6yjjDg+mNOr/BQAbRwWBsPRtM=;
        b=pQw8MyiEhKR9tbxMQ0QJK4Axb/xbWyjhjAkT4W7+3tUdCVGBWRkVCHlsnjg8CR7v4w
         /FCPkcKrjg95XwAzV+JZdBmDqxDc45YjsjmVL79ZdxTfpbaEDXS0dIlFNMOyrKONvhUF
         zTR2TLt98HzcLwbxfJYQArXiQa7WTvbuWunhCqadvX/VlZK7R4mmfdZE3+HDba6uc462
         Mhg/UOtUPbCtYjleylrDYCicixSthvAOheSy2Sv40nrHKFBhfK3xSjyYeeT4amGufYQo
         /kAkIPfSEoOy1Pp6IwzUsedzRhs5ARaDioS1V0DUvYs1KIua3obAe5ZrlJDPSZklttr0
         on2g==
X-Gm-Message-State: ACrzQf3YMkSJa801P8KGBPK4z9BZ0HONvyXSRXKsndTYPYdlBrdiwIr6
	H09oXwBza2n5qG/CKn8GXXSOCQ==
X-Google-Smtp-Source: AMsMyM7bghuS9h/0jCAZoW8otuRB7+u3RvPRMdDpIVdgW6VfT6Pm7FaGmGBHKMiy1B/XHwmLyL6kHA==
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr36526888qvb.34.1666957386382;
        Fri, 28 Oct 2022 04:43:06 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q11-20020a05620a0d8b00b006ee9d734479sm2776093qkl.33.2022.10.28.04.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:43:05 -0700 (PDT)
Message-ID: <01a38c4c-b42a-c170-3c3d-0b7e087bfaa4@linaro.org>
Date: Fri, 28 Oct 2022 07:43:04 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: add loongson-2 clock include
 file
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
References: <20221028025504.13247-1-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028025504.13247-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2022 22:55, Yinbo Zhu wrote:
> This file defines all Loongson-2 SoC clock indexes, it should be
> included in the device tree in which there's device using the
> clocks.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Change in v5:
> 		1. Replace loongson2/Loongson2 with loongson-2/Loongson-2.
> 		2. Replace soc with SoC.
> 

Where is the rest of the changelog?

Best regards,
Krzysztof

