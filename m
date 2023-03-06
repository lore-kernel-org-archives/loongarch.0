Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4617F7
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77E2C433A7
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678072898;
	bh=pv8wEDoyBv2b1A68E+Gby64QdTGgcQAxaKKzEZ9lwg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mmsT6hwIuat+dw5ClAts+TaEBza1mV1u7iOolfUNISctHIuuhoP5wp0B1xIjdalQq
	 InkuOp1S607k4AyFSYaLUGCPeySLg9V1MWe79fhZNg9O8Fc+gk05zmKA3KWaOMwPYY
	 FXEp/UIoAezznxVNw/qx1kq3lEzU0VGttbseT8mrf/J77bnHb9DLRB8JJ8MextEhL3
	 0PMUZzeHX9+9j6HIbph56wQg6DLk7ctoghIO7/GIbwhtCvbNUlHcOXmXkxP/iXRdeQ
	 wKNtd/TdU6RlJLYhPsuMDWDIPKEYUowI70JJsMtLMCIO8L28cEIffYXfU/1DgO1xkH
	 EHWDv1FcMgVfw==
Received: by mail-ed1-f48.google.com with SMTP id da10so33028906edb.3
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 19:21:38 -0800 (PST)
X-Gm-Message-State: AO0yUKV7gWgk83qwVQcl+ozT/jlMIQhery7aYJlX0CyJhBFXzekexz4E
	Pr0HPbyT7IRk/kJEwctlhaGMgY5t5J62dmglNHQ=
X-Google-Smtp-Source: AK7set+v/sQets5ucBK7ug/sAkL2ojd3qvp7Md6yoDGFmcT1Zo+FEUa7QLiDvpZuq0zeLaUe1JpDSKj1ynBL7/TpCCo=
X-Received: by 2002:a17:906:f47:b0:8b0:e909:9136 with SMTP id
 h7-20020a1709060f4700b008b0e9099136mr4488372ejj.1.1678072896840; Sun, 05 Mar
 2023 19:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230306031258.99230-1-chenhuacai@loongson.cn> <984b486f-0613-6adc-4e87-5fc00560498f@infradead.org>
In-Reply-To: <984b486f-0613-6adc-4e87-5fc00560498f@infradead.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Mar 2023 11:21:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4tMTaZQAu7tUoZXbdq0F80+BY+4eesZwavH0V6JO-RBQ@mail.gmail.com>
Message-ID: <CAAhV-H4tMTaZQAu7tUoZXbdq0F80+BY+4eesZwavH0V6JO-RBQ@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Provide kernel fpu functions
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 6, 2023 at 11:15=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
>
> On 3/5/23 19:12, Huacai Chen wrote:
> > +void kernel_fpu_begin(void)
> > +{
> > +     if(this_cpu_read(in_kernel_fpu))
>
>         if (
> > +             return;
> > +
> > +     preempt_disable();
> > +     this_cpu_write(in_kernel_fpu, true);
> > +
> > +     if (!is_fpu_owner())
> > +             enable_fpu();
> > +     else
> > +             _save_fp(&current->thread.fpu);
> > +}
> > +EXPORT_SYMBOL(kernel_fpu_begin);
> > +
> > +void kernel_fpu_end(void)
> > +{
> > +     if(!this_cpu_read(in_kernel_fpu))
>
>         if (
>
> i.e., add a space after "if".
OK, thanks.

Huacai
>
> > +             return;
> > +
> > +     if (!is_fpu_owner())
> > +             disable_fpu();
> > +     else
> > +             _restore_fp(&current->thread.fpu);
> > +
> > +     this_cpu_write(in_kernel_fpu, false);
> > +     preempt_enable();
> > +}
> > +EXPORT_SYMBOL(kernel_fpu_end);
>
> --
> ~Randy
