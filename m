Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D565F23A3
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 11:34:24 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id a24so3240698qto.10
        for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rt9We+bdFCOM6MYPx3GfU2X+tmzaOyqM9y5CbRGQOvs=;
        b=WAzJ33H4XEjVkUng4DugDH4uAkLn856Igs2TsuSMBhLt1ArrdJsd8iOPfzLnCYr9mv
         jp4iHcPMm4vJR1lcoP9SOsGSC9g7xW2Ysvh/C4MDE4lV21jhjpbF12rIAWCLJzDddS9h
         u3gLaAmi/UR+q1gjRD+HJ5fzjkLOjCKVbHpgc2hjbi5xLgxm6IVEdQzBYpgulMO7TCpD
         /qnJdwPaFCW0cFcFGXzaPoDDg1OzSxFj9AOp4gukxTrfqJKLESQCVXRapp62VQwoALMP
         8rZEEBgbqgtENXUPqhpm5OSgeOdynKERhnebvNbc2JdP6NpDHGk+JERJB670/RiS8efC
         25AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rt9We+bdFCOM6MYPx3GfU2X+tmzaOyqM9y5CbRGQOvs=;
        b=vo7yufffmFtk58Ec77yY5Zhc9LGY8m23gb34bk4eip4ho2MFT9u8wTSAyYgM04Xm0h
         iyVyiwvPptgk0mZFV/xRcXqMQGq8xOBZ0645sg1dEJHDvev+27kJAs3u2GwHwVtsnpiQ
         vONWZvvDLmH3CsQrj05NyTw6mJIikoEj6YB47LkZz1BR65qYdl3AQqAn9BRScs8hjCcx
         y3Cu+IzGylNt5eAvQTRsIuoShRfvbNrCKxmGJKaDRU4cJfs8p/DSUdetm9KtKvHVdRwu
         maNMrsyA49n4qCMSLN59yZwBd0hxPaA+svWF8AGywELVpRJKBOuMmCrcxTh4HjtQC0Q8
         byzQ==
X-Gm-Message-State: ACrzQf2fhaZErDn5R4VtYSzjXRKAHV0bHKjPIYzioZBXsGGb1O7AA03R
	Lo9BcLH4zPKfDpi5DVfyoVRiAg==
X-Google-Smtp-Source: AMsMyM7133VH+iawxms9jEJuJhxO4MT89rIyr0tQ945QwbBBADGYZQoPIILzZ0JmAncHItSZvvI3Fw==
X-Received: by 2002:a05:622a:342:b0:39c:f1a5:7333 with SMTP id r2-20020a05622a034200b0039cf1a57333mr44104050qtw.505.1666956863767;
        Fri, 28 Oct 2022 04:34:23 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id 184-20020a3705c1000000b006cf3592cc20sm2701958qkf.55.2022.10.28.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:34:23 -0700 (PDT)
Message-ID: <0fb95197-bde3-01be-874d-1b1a993ce58c@linaro.org>
Date: Fri, 28 Oct 2022 07:34:21 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 1/2] clocksource: loongson2_hpet: add hpet driver
 support
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221028073222.21609-1-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028073222.21609-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2022 03:32, Yinbo Zhu wrote:
> HPET (High Precision Event Timer) defines a new set of timers, which
> are used by the operating system to schedule threads, interrupt the
> kernel and interrupt the multimedia timer server. The operating
> system can assign different timers to different applications. By
> configuration, each timer can generate interrupt independently.
> 
> The Loongson-2 HPET module includes a main count and three comparators
>  , all of which are 32 bits wide. Among the three comparators, only

This is still not fixed.

> one comparator supports periodic interrupt, all three comparators
> support non periodic interrupts.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v5:
Best regards,
Krzysztof

