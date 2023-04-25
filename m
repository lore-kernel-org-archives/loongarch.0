Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313C33E5
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 18:55:19 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-187b70ab997so32797901fac.0
        for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 11:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682448918; x=1685040918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUVIEnaXOkJ1tFgH9AeXar4KfvKOEaKKLJ3vhZHk8mY=;
        b=ZLkcSndngyzZDOCEBtoHV0Km8V/GCimE8K8XuBl9rbRAkwd+RkU8LhxTqIGQg04uE8
         Na3e1VV9J/KIHhk4ngk1ci715PhPnEKt5xqLqOAAltwqFtdfsZ9N6La/WJ6S0uEnn194
         vQQKBtERzMjC2LxK3oiHecszJ4IqQS/31SQeQwpB1Up4mE/cBImsUnSriLgDktRcndX5
         80viuVeCXJdhvXw0emcpJCo90b8qnbRyQmHBbpwYE5S+avZRVhkjGMxEsejl/lHK+QmN
         f2ZdvjSL+kdDQlC3fBTMuPAUG67meOeaF4ET95Qb9JNVgU0JPVP5oDS/ZriX4cD9G6uJ
         yHtw==
X-Gm-Message-State: AAQBX9fI32akbJ9bK5QoIrKZ7FOTmyb331RfC+KF+NUkloOLw0M3RSn+
	DIgRyR5XEDPCDduUNfN7Xg==
X-Google-Smtp-Source: AKy350YhPbP4S0aK9DNndj5vp2UAbhUr/VFFpoNmKCnoLDBKVTCrqXLdcK5AjOK9AB8lNe10G1smng==
X-Received: by 2002:a05:6830:1e75:b0:6a6:463a:1a0b with SMTP id m21-20020a0568301e7500b006a6463a1a0bmr6587841otr.1.1682448918510;
        Tue, 25 Apr 2023 11:55:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l2-20020a05683004a200b006a43519523fsm1418611otd.1.2023.04.25.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 11:55:18 -0700 (PDT)
Received: (nullmailer pid 2080148 invoked by uid 1000);
	Tue, 25 Apr 2023 18:55:16 -0000
Date: Tue, 25 Apr 2023 13:55:16 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Marc Zyngier <maz@kernel.org>, loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org, Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, loongson-kernel@lists.loongnix.cn, linux-mips@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH V4 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Message-ID: <168244891614.2080093.10385024053617861631.robh@kernel.org>
References: <cover.1682328016.git.zhoubinbin@loongson.cn>
 <c45c402c1a524c89cbde6e1e42caaf04650ee480.1682328016.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c45c402c1a524c89cbde6e1e42caaf04650ee480.1682328016.git.zhoubinbin@loongson.cn>


On Mon, 24 Apr 2023 20:49:11 +0800, Binbin Zhou wrote:
> Add Loongson Extended I/O Interrupt controller binding with DT schema
> format using json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../loongson,eiointc.yaml                     | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

