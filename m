Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F743714E
	for <loongarch@lists.linux.dev>; Mon, 27 Nov 2023 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d8162ca490so945459a34.0
        for <loongarch@lists.linux.dev>; Mon, 27 Nov 2023 10:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701109718; x=1701714518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lHbAwOVAGp3Jtbt+Xomb+VJp96WXonwddtbec/v2sQ=;
        b=cQOfjby60/8xiyszYFS03tYsryHJSc5xDx573YF6CBuQ/KYuWZh4BKtY9it+W7c2gG
         uOJCbQF+YWLOfEvLLFsd/mHddNdTPKkkm2YpT4xTyno3nZh1t6meHGnRUAzDWah1YAiC
         k/wXzO9uiGVgeTqq1EaiDFfvYnPnfndJ2QDWFPIXVP5jTSUadzwE2OW2jyuxK1mAjQva
         EVBKHw14FulFHaW8p9mM0G/LtRfxzNBfFr8ayZjij/4Pygm5Q7qsKMojU2PRlM0qrTn3
         gHgdwT9SWbbHXiuengSZxx43L2hgez4yvcnHCDAE8j21UFQ4+iAgbwdWtffOD04Mf9hj
         AZCA==
X-Gm-Message-State: AOJu0Ywy8uFCnqSdLUufyKsoBPKkc9PL9nAHocD4bsNnY2l/rhS43cvd
	ObiAR4zBOvXE3PtXrD6RbQ==
X-Google-Smtp-Source: AGHT+IH1ioL910ojCs2BJrotcJC6TMmff95P6LzxSW4hHnZG0BZEJks3qA0x9adGeBvdttiowYqtdQ==
X-Received: by 2002:a05:6830:44a9:b0:6d8:1bf7:df43 with SMTP id r41-20020a05683044a900b006d81bf7df43mr4088750otv.14.1701109718072;
        Mon, 27 Nov 2023 10:28:38 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r8-20020a056830448800b006d3127234d7sm1400352otv.8.2023.11.27.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:28:37 -0800 (PST)
Received: (nullmailer pid 2171552 invoked by uid 1000);
	Mon, 27 Nov 2023 18:28:36 -0000
Date: Mon, 27 Nov 2023 12:28:36 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: interrupt-controller:
 loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
Message-ID: <20231127182836.GA2150516-robh@kernel.org>
References: <cover.1700449792.git.zhoubinbin@loongson.cn>
 <cae772aa897f6b10c3f5c4c93a256b50c5de4b21.1700449792.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cae772aa897f6b10c3f5c4c93a256b50c5de4b21.1700449792.git.zhoubinbin@loongson.cn>

On Mon, Nov 20, 2023 at 05:06:23PM +0800, Binbin Zhou wrote:
> Since the 'loongson,parent_int_map' attribute naming is non-standard, we
> should use 'loongson,parent-int-map' instead.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/interrupt-controller/loongson,liointc.yaml   | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> index 00b570c82903..70c125bf8095 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> @@ -54,7 +54,7 @@ properties:
>    '#interrupt-cells':
>      const: 2
>  
> -  loongson,parent_int_map:
> +  loongson,parent-int-map:

Not what I said to do. Now you just break the ABI instead of maintaining 
both names.

Just use loongson,parent_int_map *forever*. Drop this patch.

Rob
