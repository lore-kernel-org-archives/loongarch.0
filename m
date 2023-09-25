Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C4134A2
	for <loongarch@lists.linux.dev>; Mon, 25 Sep 2023 09:58:54 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so726413266b.3
        for <loongarch@lists.linux.dev>; Mon, 25 Sep 2023 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695635933; x=1696240733; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=07uVGcYaT587O+lJP2m3ZC4n8yo7xprZQQOPVOh74lw=;
        b=vj6lyd916b8RhX+8rIzGeuz/qEsGJsDSMsQIiRuI8VukD7EaWQGbAdHWQ/yFXA1yd2
         MMglMOrQ7ObXU2UPK+HK4hRFuSRkX58liQJKQCINq4pDwRuIGl1oEwEYpyZJdsoMOsBT
         xLILaC7htA2l4u98fps1tp73wLmcq1JaFgmL4i07wvruUiAz58BzI3fEJLLvSNbEY2Ia
         0ZdKqhGe1ykqgvBF1kl83p5zyP34kL9yRXEkMG8RiPgTHyrIoOjUEgc8hRf1iPMhDmK0
         EsVkcCE7xUebfsEhLe7ZYEwFQHQr/i+xzUU0Nyaj+NZb4Soa4mO5/zGvWOxEAc33P/zZ
         j9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695635933; x=1696240733;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07uVGcYaT587O+lJP2m3ZC4n8yo7xprZQQOPVOh74lw=;
        b=t5Trl5kLXhfbbHeA9jOie8HvNGIN7LAyJjn0PMP58fZ8cj4eMpyvBjRQhRg5+dH3l6
         nPoHe2++J/IpOk/vS8y30VgFL1jcztcGRLEaw91uyZwNsmTU/KRS8RvpHyBwDXVQyHtI
         KuJcKLCV/1ZxYk7S+luMsxY47rtvPLGApRFa0PhotEgxQttjIdboMYAuwYLbQKmX02XS
         VJZWhfZuRfHsy3HV4u3+HTghhLpK0emTdvOqXUThU03dRgmuF1KWl+P1o/VtyzHxmxTF
         aa8rrMf6d56bvC8+EVTRvGy7GDfllsvuwKAIIwXKh3Sca9KoxKzlX7LUZsWgvisLpSit
         3FOw==
X-Gm-Message-State: AOJu0YxlNapkRRPnh7kRWQ0cLCA+WrKDQ2N408csILOhJ0hOoNncnOqx
	f5obQ2kIHsK39vPmqmkZmW1xtQ==
X-Google-Smtp-Source: AGHT+IGSfyahZeZWFSCp2lS84BASF/3XwkdnTR8ykM/qYp0D0Ky7td4khxNtqawySDMtRTwzWoBeZw==
X-Received: by 2002:a17:907:2cc1:b0:9a1:f10d:9746 with SMTP id hg1-20020a1709072cc100b009a1f10d9746mr5022065ejc.20.1695635933026;
        Mon, 25 Sep 2023 02:58:53 -0700 (PDT)
Received: from [192.168.101.165] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090646c300b009ae57888718sm6040535ejs.207.2023.09.25.02.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 02:58:52 -0700 (PDT)
Message-ID: <311837de-5acb-4b5b-b64d-9bdc1403a087@linaro.org>
Date: Mon, 25 Sep 2023 11:58:48 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Joel Stanley <joel@jms.id.au>, Li Yang <leoyang.li@nxp.com>,
 Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko
 <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
 Shang XiaoJing <shangxiaojing@huawei.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Zev Weiss <zev@bewilderbeest.net>,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 zhang songyi <zhang.songyi@zte.com.cn>, Lubomir Rintel <lkundrak@v3.sk>,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Nick Alcock <nick.alcock@oracle.com>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>,
 kernel@pengutronix.de
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2023 11:54, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/soc to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org> # qcom

Konrad
