Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0979C2
	for <loongarch@lists.linux.dev>; Sun,  4 Aug 2024 02:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722739295; cv=none; b=gx0js26YFLAW1IIFUukiSDXdqq27Avgn355kQiTUCSlBOqTUVVqdvEMeRfxX3KXIi4nzsiR2+LrZSEGOR5tIv0+6avLYNYT3XdvceSX2zQRgpgsnywBbKwWFeilIZqBOftzeQJGxZaMFEp2F4dBPk6O+k61sjOxjwuxZk2mgmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722739295; c=relaxed/simple;
	bh=8urkFev/e2CWGnBdSPL/7h6cqqSxg6Uj8E9bdxrC2ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmeii+EjGLYDhQT9ZDct3k0kqZMMkmmjvmdlmpxhDvPaaelyrC/pFvbO4VMCaGW22mAFh0NsG4Qxt8ay8TuuWOAEeHzd2alyA/ShCSz4beKJQ9SvQiZKvGlJSWcbc7T2YTR18/ZObSW77kQDSMPzzodxK7xKCuoByL+x2uDwzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYVPccOb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYVPccOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBF8C4AF11
	for <loongarch@lists.linux.dev>; Sun,  4 Aug 2024 02:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722739294;
	bh=8urkFev/e2CWGnBdSPL/7h6cqqSxg6Uj8E9bdxrC2ns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hYVPccOb2HcPYLJz99wXGfv8bbLx/e4V/2ucoCQHHqlWoOmxnCq3hh8K6SaiyTQaq
	 QEGiypDyXPqy7uojaukKnEqHfNgLIy6TKnACkLyrA8Bq4d7HCMOzAgUlYV1USnHhvE
	 5zgSa5mNF0Wq+FcP42rkD1sg2v95yX2l9KL1BRLHmVQhmKsmGVj096Hf31YiHWC4PB
	 mVzpuDt5NVb+w94oaFJegLvr6wNxiDyocXSj5ZonmkqUtZ4W5jUM/jG71sxMqPYF5k
	 kGEuoOAdfS32veBYxBT6cJ52Ib8rDXTaWpgvvuGoVIGgk88mf2FF2X9P77umX0iUIH
	 WQMvtkjB22pGg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f04150796so14702520e87.3
        for <loongarch@lists.linux.dev>; Sat, 03 Aug 2024 19:41:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqQO2P/WaA5UVSCV7dZNKaz8QdRNfB4iCWF11b8gkBQlrUjQ9OnQ49We+QP8l7hU0Vtg7/kMwpAFqx9UDyCnGoQ+Qwq5qI9twS
X-Gm-Message-State: AOJu0Yx9cPwE+qP3bzx9EBeJMhKBlHxkqmM2ggSC03mY7Ki6EGacgJO+
	zwQpqAEvg/oMGATG1/Ap2pSgUUULmmN13fiKxNj6gCzjdsW5gusU5fyEtw84lT6ZfSq8fpncFH2
	W8mmyYx6B9l+XxytKVO0qjTKpk/k=
X-Google-Smtp-Source: AGHT+IHeWLrhdKbWjIO5SMZIde2naAxsK4SChd2Oqev9815jkXo6+eXqZV6n2MiSoEbjk0128qBYGaUY6HkIoSTmqPA=
X-Received: by 2002:a05:6512:696:b0:52c:9f9e:d8e3 with SMTP id
 2adb3069b0e04-530bb385bbcmr4383673e87.31.1722739293149; Sat, 03 Aug 2024
 19:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240726102443.12471-1-zhangtianyang@loongson.cn>
 <87o76kuqza.ffs@tglx> <CAAhV-H7c0Gtjf-6iS-E4nviMqmPWpJMNwvhWf0fLBx75pDXtrQ@mail.gmail.com>
 <87r0bb6ru1.ffs@tglx> <cff37371-0692-0db5-cb14-74c519eb1c56@loongson.cn> <87msluymti.ffs@tglx>
In-Reply-To: <87msluymti.ffs@tglx>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 4 Aug 2024 10:41:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5UEaRON4Gc3ms_790Z=JbHf8ZzdKcwqbhgBNyOLVgpJA@mail.gmail.com>
Message-ID: <CAAhV-H5UEaRON4Gc3ms_790Z=JbHf8ZzdKcwqbhgBNyOLVgpJA@mail.gmail.com>
Subject: Re: [PATCH V7] LoongArch: Add AVEC irqchip support
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, corbet@lwn.net, alexs@kernel.org, 
	siyanteng@loongson.cn, kernel@xen0n.name, jiaxun.yang@flygoat.com, 
	gaoliang@loongson.cn, wangliupu@loongson.cn, lvjianmin@loongson.cn, 
	yijun@loongson.cn, mhocko@suse.com, akpm@linux-foundation.org, 
	dianders@chromium.org, maobibo@loongson.cn, xry111@xry111.site, 
	zhaotianrui@loongson.cn, nathan@kernel.org, yangtiezhu@loongson.cn, 
	zhoubinbin@loongson.cn, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 5:31=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Tianyang!
>
> On Sat, Aug 03 2024 at 14:40, Tianyang Zhang wrote:
> >
> > We consider that since the original extioi-msi is still using the
> > legacy-MSI interrupt model at irq-loongson-pch-msi.c, if per-device-MSI
> > is directly supported in the AVEC support patch, it will result in the
> > simultaneous use of two MSI-interrupt-mode in irq-loongson-pch-msi.c,
> > which may seem a bit strange. So we decided to split it into two
> > patches, the first one using tlegace-MSI to support AVEC interrupt
> > controllers, and the second one will be uniformly modified to use
> > per-device-MSI
>
> Adding new code with old functionality to convert it five minutes later
> to the modern interface is just backwards.
>
> Convert the existing code over first and then add the new one, no?
Yes, that looks better, thanks.

Huacai

>
> Thanks,
>
>         tglx
>
>
