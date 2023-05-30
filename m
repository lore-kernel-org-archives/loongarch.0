Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2A1125CC
	for <loongarch@lists.linux.dev>; Tue, 30 May 2023 08:08:25 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-96f5685f902so620877366b.2
        for <loongarch@lists.linux.dev>; Tue, 30 May 2023 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685434104; x=1688026104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQhjJ+6D9VsTTMDieSwfWtpvTuOPCjU+h7AtDdnwYcM=;
        b=iOIgj8Tjhk5wu3ob5u7Zk7NjAWU5m8PbqRtznROJZ30GAgsI8TvPzjRkDJXGqrwZtS
         eWoGfcuKJWSR7619n9y+doXwOCHSI7JpNx4TFwD5XflWa1Dsq4d6zeVlmER1b38973x7
         Ns+Ub1NTxEe9rzfJgXNQ3+txI+Yu174kPVlGS3ODtVJ6wb3dC3MzcqBgQwu/sPFpCD2H
         d3kkGmE6v4J0404GdcV6/++laiJeQxikgDv6MNUkrDkIKMWm4ln3GT96wnMuyrbDgUOM
         bos3B1G9EkWDLcKGdRPMWvhS7Kh+afVSVY9aInTrWW/VwaVpx+O5aZrHBqQKdu91TfXt
         PmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434104; x=1688026104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQhjJ+6D9VsTTMDieSwfWtpvTuOPCjU+h7AtDdnwYcM=;
        b=IW4EnIN2TcJHan7g9Kbw/UuHDC0ZbKoQ6tLSoFbDesKBsnfdtd+Oa3Cgso9eH6Z17L
         sMiFBf3EtotzQAwji7He5F97tCyLbSHeYbhCTLvjuuT4fCMTbvi3ofX+7sZhX6nxGmhx
         LZFIOJsKcCVswEeNvB6/biPsnW6rRShNu/0skjWR/0WYjV4lOIQ5T6ywd2DJaUBJGvAp
         67PvWl0DakqJl4Z2ndGWGKbagnKoR9uwG71zqxXs8HgtX0mQ8lBFW2wjlgVfKLscCe77
         Gerj4NYqWGnOu4jK8tqps3Yl1S4+5MtJ/FKNL551y23KWu5UMy8OwQrSNJyXUB2uQwqP
         vw3A==
X-Gm-Message-State: AC+VfDxcz0CTAFgMcCTnVVT7LbXpYQvP3+cyY1/YxgObhhUw9Q9h+LDE
	jrJfL9eq7fDgiBE2D1iiW07MCg==
X-Google-Smtp-Source: ACHHUZ7zESSJK/T+t45vczioXDndjnO+H2WtnGA8SN2N6SO/FRpryfGtWVdQHvCzmNgM89NX54j1vQ==
X-Received: by 2002:a17:907:97c5:b0:970:482:9fcd with SMTP id js5-20020a17090797c500b0097004829fcdmr1740437ejc.24.1685434104165;
        Tue, 30 May 2023 01:08:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id c7-20020a170906154700b00965ec1faf27sm6926113ejd.74.2023.05.30.01.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:08:23 -0700 (PDT)
Message-ID: <2f883bad-2f8e-ef03-fc3f-c13980fb1536@linaro.org>
Date: Tue, 30 May 2023 10:08:22 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 2/5] rtc: Remove the Loongson-1 RTC driver
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 Keguang Zhang <keguang.zhang@gmail.com>, zhao zhang <zhzhl555@gmail.com>,
 Yang Ling <gnaygnil@gmail.com>, loongson-kernel@lists.loongnix.cn
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <98fc717871d3a39b18ad1a26780d0d2cf1fa0896.1684983279.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98fc717871d3a39b18ad1a26780d0d2cf1fa0896.1684983279.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/05/2023 14:55, Binbin Zhou wrote:
> Remove the ls1x-rtc driver as it is obsolete. We will continue to
> support the ls1x RTC in the upcoming Loongson unified RTC driver
> rtc-loongson.
> 
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: zhao zhang <zhzhl555@gmail.com>
> Cc: Yang Ling <gnaygnil@gmail.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/rtc/Kconfig    |  10 ---
>  drivers/rtc/Makefile   |   1 -
>  drivers/rtc/rtc-ls1x.c | 192 -----------------------------------------
>  3 files changed, 203 deletions(-)

Removal in one commit and adding a new driver in second is not what we
usually do. We expect code to be developed and to evolve.

Best regards,
Krzysztof

