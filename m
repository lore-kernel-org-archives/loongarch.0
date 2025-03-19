Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507608F4A
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 04:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742358867; cv=none; b=IazNb04Y2Br0sqH23hOrjMX4+sG1m3NVpjPEccyMnmWXfEfZ/jfAxbMyE7mt0mAHhsfrfBjiIBxwbZ1y8KoHmKC5usKSh3uKw7TtGR6c5MWwHAHPiT2QNrIiPqe87b2X2oxmKiBRJlLtgBebXoIYQ46/ElyG+m0kvwg3LUY/W9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742358867; c=relaxed/simple;
	bh=tb219t++8fRJ9kz/h+J19vyhypnb0UhgT9+U8D020bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNEzNgYXZexK8LYBgChR43OUdBFOM/ix2U0hI1qny0sHXqAhMM332wjosf4dpRUhm/sP8HA92cj/yi0oAWGuxvNb0uvXjpGAHkmd/H7hY6mAthqxuGooAVvdR5Dr+UhQnTl9P6Be2e6p+iqVk/e2V1qEuMucivn3HutsntmHhjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQEQlezT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQEQlezT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8150C4CEF2
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 04:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742358866;
	bh=tb219t++8fRJ9kz/h+J19vyhypnb0UhgT9+U8D020bc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TQEQlezT3icpgS5UbjL3/nuA4SljClyWE12hCxCswaAYUwAkXl/2EHo5W3b3aqoPz
	 KybXxSvVCkAuoyju4KRem5WqKV+LjTfvOf34qtC4CNwJ5Ds+duQ/QufgxWQWafBcXG
	 jyPjFDWdzelKK6FYV0heWl/NYrz1R+uG7PL3LMyzJ5d/cNoYvlHaG4C7rUoKtByI99
	 miTmEcsa2ouf8y+7BztHintLLGValjs6nxGIMFSkyMIIH1lD+VL03wbqunD0oBEIcQ
	 HZ2rBNViveTmHkSgc7OT14V7zRK7JOrfnHkDFJQhO7lRWa1su5O35ORw92tMBe4Zgt
	 7vEmB7/ZzsAlA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac298c8fa50so1181497166b.1
        for <loongarch@lists.linux.dev>; Tue, 18 Mar 2025 21:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWggSoh0670WMPE34KST0IUHUPmca2RE1uHH4DcsH5kUwf/q1tmFqRer34vgECLdmUvvOiOE8N44wI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFyK91jmYR+tpavn85Lz9io46xzBgViWkvpr4DludzZ0FoNlQT
	TvMeH8+xclC0fY5Z8hnmkDCEIHM3A8qCG6/GfRY//W+LgKKmahXntZXB7bym5qY4OvPQJ/2W77r
	8/8F2Oon76xI5HeO1XA7G3zfdQOA=
X-Google-Smtp-Source: AGHT+IEKrD5BVHlMH5cIfN9exRPHgKjBOjN4LuEaeAb1uQmrKcOZ45guA8zoWyTH6F5sw4ba/gyC/dA0IVDr8yKg6Bs=
X-Received: by 2002:a17:907:d7c7:b0:abf:68b5:f798 with SMTP id
 a640c23a62f3a-ac3b7a9bc3amr122518966b.9.1742358865242; Tue, 18 Mar 2025
 21:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318110124.2160941-1-chenhuacai@loongson.cn>
 <20250318110124.2160941-2-chenhuacai@loongson.cn> <2025031834-spotty-dipped-be36@gregkh>
 <CAAhV-H4y88jfpKp1mFytEjX4L0CErF=XFashZ9dXfwM58dPGGQ@mail.gmail.com> <2025031852-angelfish-mouth-f455@gregkh>
In-Reply-To: <2025031852-angelfish-mouth-f455@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Mar 2025 12:34:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ns+HQ30p++eG97iaDBm4pZB+8XpjhcaC1Czx_iex6FQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq1LpF2KOdiplv8HT0Ag3bf_-gr0IrAGadWDR9ZsBLQNMLwC9_sXBuayzA
Message-ID: <CAAhV-H4ns+HQ30p++eG97iaDBm4pZB+8XpjhcaC1Czx_iex6FQ@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 1/3] sign-file,extract-cert: move common SSL
 helper functions to a header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jan Stancek <jstancek@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	R Nageswara Sastry <rnsastry@linux.ibm.com>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 10:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 18, 2025 at 09:58:26PM +0800, Huacai Chen wrote:
> > Hi, Greg,
> >
> > On Tue, Mar 18, 2025 at 9:25=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Mar 18, 2025 at 07:01:22PM +0800, Huacai Chen wrote:
> > > > From: Jan Stancek <jstancek@redhat.com>
> > > >
> > > > commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
> > > >
> > > > Couple error handling helpers are repeated in both tools, so
> > > > move them to a common header.
> > > >
> > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > >
> > > Is this "v2" as well?  the threading is all confusing here.  This is
> > > what my inbox looks like right now:
> > Yes, this is also V2, I'm very sorry to confuse you.
>
> Great!  Please resend them all as a "v3" so I'm not confused :)
OK, thanks.

Huacai
>
> thanks,
>
> greg k-h
