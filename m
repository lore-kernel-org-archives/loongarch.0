Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D6A8BF0
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 14:15:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q7so13277765ljp.9
        for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDk+RgMXh2bcnf3sUSR69iJbOx6/yOw6ydW/1FhZE54=;
        b=k365y/G3nBImPTN8GetA9qitbyHs5nzSNJbtyU1VpJJs7siH8YxrOxNDp5raL7VcmR
         HEcxW+x1MesHwYYf8EdOfLAlMVR5l15YaTQklQxDJdZC7lG4DyVYfV4Jf3Ik2lvpCjcf
         eTDWYC5ZNueOl23RaCj6krfOdCBlc0uNgfW9/49feJBsyt+FSk5dM3Gd2dMo6SUehKr3
         rJ2y4kxhh2+XLtnBKvDu06rRDccOCwsNnMY7BeVvgoCNyMZ7MsI02bmwGTC68I0A55Zh
         0Sv5vU73WdMV2m19Aja1zLmNq58hql+ttR7OAXKMXD58B1qwA2kCIH748uNveGLzdizK
         LnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDk+RgMXh2bcnf3sUSR69iJbOx6/yOw6ydW/1FhZE54=;
        b=zHwzIC51/qvUN/McCLoetytwNGJlBJRsckPQOBTk0f4mXsdIyzgzx6yNUOcDPdBdTd
         +Ap3zXNXvejL4MI/1HVz8uGtJtAGbGTkuXWxHmo/6qPQamDfCG3CpR+vUlx+AD5Cyp59
         ubFPBUAmpMh+lhdLfu4n6DTdnnXHf5XVCcAk4vs8x48uIvd/nm5SsdXk+iZWj7q+gggn
         o/SFyhZv4awU1P0BQFP6SfmByPuuN5SeF2WaWZdyysK+7L12g64ZNIO8BhTTGxVXP7EG
         K108Htb/LOrZ0re/iq8+fQJ8D6yr7b5Hgb6HZ1QoogezlsTIAaEhHBhkJWxwOVzgUJWG
         d85A==
X-Gm-Message-State: ANoB5pnAa3gyrPTjGiBOp1H08OOeLvJRvWXGJcXHEAj8j0AjqzLBeCf5
	CHBIPhAmMOVPcqs66T9/+0nI3w==
X-Google-Smtp-Source: AA0mqf4w8/6dh9E18VGn4p+sg3dHASbUTnSG3xCMqbJhl35aK2YZUFEI3d97RxH8LPvRVfs4XWFzxA==
X-Received: by 2002:a2e:2a84:0:b0:279:9500:4b19 with SMTP id q126-20020a2e2a84000000b0027995004b19mr4847785ljq.71.1669644926645;
        Mon, 28 Nov 2022 06:15:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c11c400b0027998486803sm817266ljo.130.2022.11.28.06.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 06:15:26 -0800 (PST)
Message-ID: <026d3af4-1903-4486-f127-691b8ea7a2fc@linaro.org>
Date: Mon, 28 Nov 2022 15:15:24 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X
 I2C
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org
Cc: loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
 <61541d15-fbfd-3f99-fc05-663ebf4a2b54@linaro.org>
 <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2022 13:24, Binbin Zhou wrote:
> Hi Krzysztof:
> 
> 在 2022/11/28 04:49, Krzysztof Kozlowski 写道:
>> On 25/11/2022 09:54, Binbin Zhou wrote:
>>> Add device tree bindings for the i2c controller on the Loongson-2K Soc
>>> or Loongosn LS7A bridge.
>> It's a v3 which is for the first time sent to DT maintainers...
> Sorry, it was my mistake, I didn't double check the mail recipients in 
> my .git/config.
>>
>> Subject: drop second, redundant "bindings for".
> 
> Ok. I get it.

Actually, sending bindings and patches for same devices is a waste of
everyone's time:
https://lore.kernel.org/all/20221117075938.23379-2-zhuyinbo@loongson.cn/

Get your upstream process synchronized. Perform reviews on each other
patches, check mailing lists.

Best regards,
Krzysztof

