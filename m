Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063E1EA01
	for <loongarch@lists.linux.dev>; Wed,  2 Nov 2022 17:40:17 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id l127so3547847oia.8
        for <loongarch@lists.linux.dev>; Wed, 02 Nov 2022 10:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn3Md3DDfmwu7mRJMxtw1Zqk7ZmyZ+wVWjGzjR5XqhI=;
        b=h4Sg6pWQ0osJ4tYLULuedaVQSEPTxyOhjgypNde7cGV65tTsem2bYPlNxTnu9D15a3
         1CEFgWPPy+/8X4BHoEJVJVDQpqKu+skTCT8xr131KJO5Lkf5YIGot858RzCfvTdaPH5X
         kMy+fppmeFt3zM3FOuG0juIOPqRZ9SUYreoSzB0FYiCLAYFIc1fz0yhk0t/QbaHAaycF
         l7B6r2x9h/aK3j/DLV9F8iAv3kq4wuXrkc8jQBXo2roKtKchspO0vJOA9OnwUuA1AexV
         6BgQ/R1KA5n3v/FV5W3QWeMSefxdDSuwYjOzNFOFJigK/IB1mZdf9YYgRP14pOoZFTUH
         4p0Q==
X-Gm-Message-State: ACrzQf198Yyp3Fal18sMgStG+ZKGh3Jee6DwVeseN9bQvHw5n9fvQW8z
	IvLLywIlXWE3hb78Qdmrfg==
X-Google-Smtp-Source: AMsMyM7oXYtc9f6PWQYuC20JPF3XtzpncveMbbhlpWcpJrh6XWLEekXVe/HHbdZiH/n3hyzjxANQjQ==
X-Received: by 2002:a05:6808:1582:b0:359:dc30:d716 with SMTP id t2-20020a056808158200b00359dc30d716mr14210554oiw.104.1667410816627;
        Wed, 02 Nov 2022 10:40:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g93-20020a9d2de6000000b00666fdab9da7sm5145036otb.78.2022.11.02.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:40:16 -0700 (PDT)
Received: (nullmailer pid 11369 invoked by uid 1000);
	Wed, 02 Nov 2022 17:40:17 -0000
Date: Wed, 2 Nov 2022 12:40:17 -0500
From: Rob Herring <robh@kernel.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Lubomir Rintel <lkundrak@v3.sk>, loongarch@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: soc: add loongson-2 chipid
Message-ID: <166741081722.11313.14449505612000016628.robh@kernel.org>
References: <20221102035511.19972-1-zhuyinbo@loongson.cn>
 <20221102035511.19972-2-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102035511.19972-2-zhuyinbo@loongson.cn>


On Wed, 02 Nov 2022 11:55:11 +0800, Yinbo Zhu wrote:
> Add the Loongson-2 SoC chipid binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../bindings/hwinfo/loongson,ls2k-chipid.yaml | 38 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
