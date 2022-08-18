Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1F15AC
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 06:41:25 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id l1so407564lfk.8
        for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kjPTotdKjvEDDAHNy6fKqwSVnrlA5hvU4qORmBZM7/M=;
        b=NixcghVgXXFL+gHEMQkFJ8FdBomoNLONh7drv5JhIbUfcVoiqnKvVspH5NBtlZfzeL
         p0Z18hgEwbx9W/qaBFxFYmnsXObdHegimcGoCAj2Th4S/riM1mzB9MjtpTTbZNXttrBH
         /aMbfMSA8qUGQGuCXhzKHamnftQSFqLhuu6xOpeiR4SnWhtFwuBLUvCehmiK/Im6+o8U
         vArmeqa20gHo/ROKc/AWL4V4YQA9xTwbO+9fCVnf+vQ6ktx3a8K4MAM/LhW1HJxbx+Fw
         0XsU3qFTLrMdatcP4hm8LUZnoqU90mXY0Do48oAJcj3/K6vY10sJHdQO+7YGUb+zrzp1
         L/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kjPTotdKjvEDDAHNy6fKqwSVnrlA5hvU4qORmBZM7/M=;
        b=hUEKf3W81PTJx1VaopiWU7xvGauC54TRQ1XO8p0FRYJ0Io8MbwuRk45YQfUCXcu9bW
         XUh5ZV/oZpGKRR75OWObJ+kUhtDIUeVikIok1fwLKF5Tp+Nh1VxBEWqopNgY/NC+3f6H
         RxJ05ewKvQ/k1dIgma4Q9anY9N+S4mTR36SaaBHAHItbbN1WmN/ww+XM/3PiEdn8fqD3
         Rsq8Fp40wzV4/ZoCOToNnCBIVsGJn6g5rH7EXi9DGa69ka8jsk8xrCSzd3xbBodpsh6I
         dssMZv9PVRIzKfOi3KsKLtzKVzLpXn0IBQFhGpSVCkZD6AAn3xiFpqRQ7QnTvUxjHAza
         5pDQ==
X-Gm-Message-State: ACgBeo0WQZm8MvBagohgZ2rop4FXvWLuyJrnix/raL5JHA79uKnEdwrf
	WWIRKNq0qq5BxbDmUB/fO9c7sNsgMpCwtejY8gg=
X-Google-Smtp-Source: AA6agR5/XvyeJiZt0dqbaxscqbS2XOsF8aYUMnZI1ZkN8wr4S3Blnre0OtIFc32aCUlHAQWxVVlRXUBrGD4GJk/PrfE=
X-Received: by 2002:a05:6512:3d8e:b0:48a:eff4:6b03 with SMTP id
 k14-20020a0565123d8e00b0048aeff46b03mr481285lfv.49.1660804883384; Wed, 17 Aug
 2022 23:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1660720671.git.chenfeiyang@loongson.cn> <5bf66e7d30d909cdaad46557d800d33118404e4d.1660720671.git.chenfeiyang@loongson.cn>
 <20220817200549.392b5891@kernel.org>
In-Reply-To: <20220817200549.392b5891@kernel.org>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 18 Aug 2022 14:41:11 +0800
Message-ID: <CACWXhKkJGO5PV8kBurR5Urf7XAiDKgX3b6epn0SPMkZdBH6iUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] stmmac: Expose module parameters
To: Jakub Kicinski <kuba@kernel.org>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	Feiyang Chen <chenfeiyang@loongson.cn>, zhangqing@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, netdev@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Aug 2022 at 11:05, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 17 Aug 2022 15:29:18 +0800 chris.chenfeiyang@gmail.com wrote:
> > Expose module parameters so that we can use them in specific device
> > configurations. Add the 'stmmac_' prefix for them to avoid conflicts.
> >
> > Meanwhile, there was a 'buf_sz' local variable in stmmac_rx() with the
> > same name as the global variable, and now we can distinguish them.
>
> Can you provide more information on the 'why'?

Hi, Jakub,

We would like to be able to change these properties when configuring
the device data. For example, Loongson GMAC does not support Flow
Control feature, and exposing these parameters allows us to ensure
that flow control is off in the Loongson GMAC device.

Thanks,
Feiyang
