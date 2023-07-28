Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9567C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:47:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so57235e87.0
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508840; x=1691113640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm1gYbFDcg5j5Vi8V4yEePrlSrcnPZjYLr+SXH4vwOw=;
        b=WdbaMnUWaFWX0g3sadRN5u1RF6/arT0wqY3EfBT8Lf64KvCTcJlOgT9kpBkr4/bk05
         CVYb9yv5fmcxCrCR1zXEBydOl3gkEgWuOuKZyYIHWi/6C4XS0l1UGC4sgXB42Im/mV9F
         5x6670+KAJgTPItGFnWdu/WAXZ6DLJvzS4eUR98Ak+XNuSva19N4Y+yWNO+n8HVPb6C0
         etYm06H5rCrLegNBOm6fm2VpqRHmRt8gn48GgJw//sA5mDS7uCyokYE46mHVLyM1wvvl
         x+lrwocNdUsS6ZMvS3oCpPuPyjYNCquNnePHzl/+tt7H0uJKRKCZ7JO43PfpVohXQ3tu
         2dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508840; x=1691113640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm1gYbFDcg5j5Vi8V4yEePrlSrcnPZjYLr+SXH4vwOw=;
        b=TjV9UIaVwEnOVQ1QpXi9AcXVg928OV+aOTnBklKxnfSgw3sT6vWmVISXk7oj5ysYOM
         FYcBsbK29UUmZmDhHXbxqhmaUlQvrGX9aQBzHXajxfLnEMSJnnX0JlZWj8zdIfvy4C8D
         6SgPL9yL9BYb5keTpITnE+sDkR/sfFWQ1bf7ghITwuyH/0XFICy5qwiNP9oj4xgbRH56
         31o0FibNt5y2hu48It0+pPUq99C/EIakCi48+vEjVXxydUfvFWjh09zn1qMrD0G58DC+
         DKM+v2ZKWgLlPdfEkVajrqrkJQXoXtiiAeAQZKUtsv95dz8++H3aA/KAjZNHai3bbGHb
         nU3g==
X-Gm-Message-State: ABy/qLZ/absA67UN6o5l70BJbVCybDGh+1cpmjhXvld/7cyvjcnmaUJG
	3VO6//YfV8xX+oc8maXM9G+hsAt52CTHIAlK6qw=
X-Google-Smtp-Source: APBJJlF3wfXSgmojSnvQ5m9sqGoPdSc5VNoFI4Nu07B1CKoKJNFr0spXOvZMfswk+r2Y5/hzGV3eZgmHioMhKLJ3ivs=
X-Received: by 2002:ac2:58cb:0:b0:4f8:1e2a:1de1 with SMTP id
 u11-20020ac258cb000000b004f81e2a1de1mr324875lfo.29.1690508840330; Thu, 27 Jul
 2023 18:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <f626f2e1b9ed10854e96963a14a6e793611bd86b.1690439335.git.chenfeiyang@loongson.cn>
 <26015def-bee6-4427-9da4-ca27de8c1d87@lunn.ch>
In-Reply-To: <26015def-bee6-4427-9da4-ca27de8c1d87@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:47:08 +0800
Message-ID: <CACWXhKmtJCQsPb2AoyxHEMzhxmanmYheM9dKAGdkf7M3fqa75g@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] net: stmmac: dwmac-loongson: Add 64-bit DMA and
 multi-vector support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 6:38=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +     case DWMAC_CORE_3_50:
> > +             fallthrough;
> > +     case DWMAC_CORE_3_70:
>
> You don't need fallthrough here.
>

Hi, Andrew,

OK.

Thanks,
Feiyang

>     Andrew
