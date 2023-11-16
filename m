Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523A4415
	for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b2f28caab9so679063b6e.1
        for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 09:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700156489; x=1700761289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABfkYaj47jaES+mQXWgRNK27QJ0O5U/rrf/a7dbWEMg=;
        b=mHRmflIvihbu1s5mEptPIfmbf7cDL1UzSzSp3JY1w7KVpcbLU4CjP2N9na5bX+h0lO
         hMTa8doUzY6P+92PsX8cpo9D2r/DUWwEb1fhKyi9NNpgkKMRCZNvvrnhSp4713rvUj5G
         Qm2dfNAUooGe1RzSwUHHvtkNTrpP1jTO0JJylZE5/jSWlRdqSdtccztM9w9qokQV/iz+
         7Gmj25tr1KvtRjlzZlCvreoGyidoV3oG7EXuYXuZY2rOfSFy4fxQ5vQNA283n55Xswk4
         LqKD8iaKLhal9lebVIhCutYJWMHTNVdt50ZEc1X5lJLE6XjrreLRGu/j48MduYoHF/gM
         1s+Q==
X-Gm-Message-State: AOJu0Yz2OpMfcl32O80JA/ANoSEN6AY8Ehy4p8IXJD+c7Hufel1sylcL
	EXmY+ERvyaemcTB0sXjeEg==
X-Google-Smtp-Source: AGHT+IE6t3oIR0pf1vfQIwTEe5MVblRWpnxB1ypu8pSSJiWzA0ah9nyrvXeg+GJHD3IVeuYLd+lTLg==
X-Received: by 2002:aca:f03:0:b0:3b2:f27a:8a52 with SMTP id 3-20020aca0f03000000b003b2f27a8a52mr17997456oip.41.1700156489652;
        Thu, 16 Nov 2023 09:41:29 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v19-20020a544493000000b003b2e536a96dsm1899274oiv.24.2023.11.16.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:41:29 -0800 (PST)
Received: (nullmailer pid 2522272 invoked by uid 1000);
	Thu, 16 Nov 2023 17:41:27 -0000
Date: Thu, 16 Nov 2023 11:41:27 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: WANG Xuerui <git@xen0n.name>, Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongson-kernel@lists.loongnix.cn, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Binbin Zhou <zhoubb.aaron@gmail.com>, devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: interrupt-controller:
 loongson,liointc: Fix dtbs_check warning for interrupt-names
Message-ID: <170015648721.2522214.13442341316883618917.robh@kernel.org>
References: <cover.1699521866.git.zhoubinbin@loongson.cn>
 <a162081f9b707580700a2b10719300511c6e6baf.1699521866.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a162081f9b707580700a2b10719300511c6e6baf.1699521866.git.zhoubinbin@loongson.cn>


On Mon, 13 Nov 2023 10:36:45 +0800, Binbin Zhou wrote:
> The Loongson-2K0500/2K1000 CPUs have 64 interrupt sources as inputs, and
> a route-mapped node handles up to 32 interrupt sources, so two liointc
> nodes are defined in dts{i}.
> 
> Of course, we have to make sure that the routing outputs ("intx") of the
> two nodes do not conflict, i.e. "int0" can only be used as a routing
> output for one of them. Therefore, "interrupt-names" should be defined
> as "pattern".
> 
> In addition, since "interrupt-names" and "interrupts" are one-to-one
> correspondence, we pass it to get the corresponding interrupt number in
> the driver. Setting it to "required" does not break ABI, because it
> is already logically represented as "required".
> 
> This fixes dtbs_check warning:
> 
> DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: interrupt-names:0: 'int0' was expected
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> DTC_CHK arch/loongarch/boot/dts/loongson-2k1000-ref.dtb
> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: interrupt-names:0: 'int0' was expected
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> 
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

