Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46BC36A
	for <loongarch@lists.linux.dev>; Fri, 15 Sep 2023 00:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C14C433C7
	for <loongarch@lists.linux.dev>; Fri, 15 Sep 2023 00:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694738198;
	bh=+qbxUBHe+EIILZxn+XcMrO9roDx8RWwFA2dcxApnUkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lHUN/KDpghJkNYy5FKNSdLgvhnWYAGmCQbcQ+r4R6iN5cY8NWdFk8umOBNjPzGd4f
	 rfVeD9X+moD6ef2DgeyUW2ZkO8+b5VnLUCF1lfmFxXl5BQ1Zr5gjAji9NCazklVwXP
	 rt7ZRJ2PufkZwke49eQF5n+wJGOJkqEQIA7tpaC+Tk9PvDwjjLvtEnFD5V0bDL+hHP
	 9/2bSbRYdEEai3CHF7/pp31kk9GiyT+87MZBToGgFulin5+xslBe9dFTCh4TZLtZ6K
	 Nk9SqLKZPoOO8NwKYKBQVoVIMVkOf8q2eiHD4dO49JE8GVTmg64LVIRitz9uLeApQK
	 auYyO+GlcxOZw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-501be2d45e0so2715430e87.3
        for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 17:36:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyz9l0GtJ49dHLhG4N4avhqUKJx8DNDYS4R+K/QiC5uzALxosRH
	HZERdtBamnTZUZc6rFkjaLPWS5nprE3tQupXFf4=
X-Google-Smtp-Source: AGHT+IHwKzw38ZOBSzff8lAyHvC1kolSpF/FXRnIiwjQslprjSV+XDoUZtf0NmWK5BzGVa5yZ/5jx6G/mVt2YowIo04=
X-Received: by 2002:a05:6512:2208:b0:500:af82:7dd9 with SMTP id
 h8-20020a056512220800b00500af827dd9mr217351lfu.62.1694738196898; Thu, 14 Sep
 2023 17:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
 <CAAhV-H6Q0sirFEDdc1v4BSfDY94eZvJazy0XLKM8V94GMJvQnQ@mail.gmail.com> <ZQNWh2DY319jGbfq@smile.fi.intel.com>
In-Reply-To: <ZQNWh2DY319jGbfq@smile.fi.intel.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 15 Sep 2023 08:36:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H66LUWHP-eGp6VGvs0F+QD=QJ69uR3_1A3SqH9cyPUPoQ@mail.gmail.com>
Message-ID: <CAAhV-H66LUWHP-eGp6VGvs0F+QD=QJ69uR3_1A3SqH9cyPUPoQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: Add missing headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andy,

On Fri, Sep 15, 2023 at 2:53=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 14, 2023 at 11:25:22PM +0800, Huacai Chen wrote:
> > Hi,  Andy,
> >
> > Thank you for your patch, can this patch solve the problem below?
> > https://lore.kernel.org/oe-kbuild-all/202309072237.9zxMv4MZ-lkp@intel.c=
om/T/#u
>
> Nope, this just adds missing includes.
> No functional change, so warnings will still be there.
But I think a patch should solve a problem. If we don't get a build
error or warning without this patch, does that mean the 'missing'
headers are actually included indirectly?

Huacai

>
> > If yes, please add a reference in the commit message. I have
> > investigated this problem for a long time but failed to solve it.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
