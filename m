Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575EA1C06
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 14:28:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id cr19so10019410qtb.0
        for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l439+0R5hO/yRk1J+3UmLizSxKZrKGZyR0O124ef93c=;
        b=ZfFHFEdLr++H9TznwXfWaSgfrldon+JVu4ZhPk/fPCUtsE8Odks2IPXyMZC9/hQCt1
         wUj4yNGIgo1aL1o6wV+5hLweYQwPX/NpmTGrGEsya8CDudaIWVmeuvqUUdHw5C4dHrc+
         cCfItGQTwsx+PRh4FlH2H35POSGMxx5ToenlLbccOVeaFM7luoSLwnOoL2owPWVg9Z6K
         xBDEOYwreHgWchDVxKu9Tgn0B8ZbZFznjMSOE9OLjqQ/0jjEBKd6V+YcF8p7aQCVVme6
         FN+lgF9IcXEoEdUfZWM2S6CLb3d0zxsyuH6atEL9n5Bu46K7OymWzEQzzO67TBZeXMuf
         hxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l439+0R5hO/yRk1J+3UmLizSxKZrKGZyR0O124ef93c=;
        b=NgrwQZX0Yh5QSBi2uGmD3SzxtewE9B+N6x8aEgH1DxLsey3Hek8xZwxBIyO3jaE5Kx
         JSRlK9Pg06cemFcdKrhtLyBNQVnvip87VdvuG6gK3nUw8+TxkyCZlwf2bJiAjzrVhtfb
         A+h78DIoowR+fZlfstbL/tRHgNe3LjsjL/tSUJ6J1Ydzdu/CFn92ipLiKF6+g+PnlGFb
         jwjNStfHbIP1lTFmfpJEiJoD5PkvC93ReV1sR1aNDgiotfyncnIdG9mV9YcpVhsnsYG9
         mieI31f4Hp3XHg5kqFW5soogwYSRKgl4vrV72OlKrRAHdxlur4f3/MW2oQI6mi6ZCkes
         02yA==
X-Gm-Message-State: ACrzQf1Dy3u1G7LxlcxmlQd4rKNnaJ75+XtPnDL+Oe3K+HMYpZDrUzWW
	nmF+MJdYfK+RbYSae6/Q6IYA4Q==
X-Google-Smtp-Source: AMsMyM5m1uinfI4UXc8SZtse1r7FwSlklruraaJd/xVhVOs+Tk2bRefK0Tu45oSL6DAaO2OGvJc6EQ==
X-Received: by 2002:a05:622a:138b:b0:39c:eb5a:5c33 with SMTP id o11-20020a05622a138b00b0039ceb5a5c33mr37048294qtk.412.1666794500218;
        Wed, 26 Oct 2022 07:28:20 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id f12-20020a05622a114c00b0039cde2cd510sm3279219qty.28.2022.10.26.07.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:28:19 -0700 (PDT)
Message-ID: <1405ff3d-7d20-b604-189b-6730b8231ed4@linaro.org>
Date: Wed, 26 Oct 2022 10:28:17 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 2/2] dt-bindings: hpet: add loongson2 hpet
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
References: <20221026035752.32681-1-zhuyinbo@loongson.cn>
 <20221026035752.32681-2-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026035752.32681-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2022 23:57, Yinbo Zhu wrote:
> Add the loongson2 High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v4: 
>                 1. Fixup the clock-names that replace apb-clk with apb.
>                 2. This patch need rely on clock patch, which patchwork  
>                    link was "https://patchwork.kernel.org/project/linux-clk/list/?series=688892".
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

