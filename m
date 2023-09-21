Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B803D90
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 07:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9132FC433BC
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695281415;
	bh=0bQtjj08lQ7hZmIm0vxcQccxzsqdYVfn5uDbCn+u2Wo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nDXhmIoqswRZf6OZwxkKd+b2w/PZSNX3p73vVn+sIczXPP90Re+yrYaPNGnyYEUdk
	 GDoOYo2r3RaxQdyin23+xfJKFERvWCsLJWfYkK6Nhjwv0bJwUNsxFwk3AK8bOfnEys
	 V+PR7WbCG5Y+7ZkX/NJxleqjbO9XEWz2HFb/0dqj6QPw0OC5B0AdhPjMWqJ2n86hUE
	 WU6xN/Jaey1db+YaDjcwrC/6NCRExhhVzB99aFokesVVSpPEsu6Hg8a3iAUwBBMDQD
	 s8cmzut5E6sk49Jc9+ukLvo0OXcS6XPQvFjI7V8wjNmwnW8IRw3cQPOlNDRpRqQZX2
	 q/cjEartPJD/g==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-530bc7c5bc3so676698a12.1
        for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 00:30:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YwiUlkx5MGmKU4evDDVweZgnyWf7A7/bvYdQFhwwuJZKK7PK/KC
	Q+ae8cvyQSdEGpFeGDSQpyQcRuokN/eiJU0I4tI=
X-Google-Smtp-Source: AGHT+IFJ26dacuxbCaSY19LvtayzyHj7zwflLmuyY/j24DkQ4afyqJ9S4hS8w5NXT67uXj/IC4wkcXjisCEvqkQhJgc=
X-Received: by 2002:a05:6402:88e:b0:522:2dcc:afb6 with SMTP id
 e14-20020a056402088e00b005222dccafb6mr4337061edy.7.1695281414022; Thu, 21 Sep
 2023 00:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230915014949.1222777-1-zhaotianrui@loongson.cn>
 <CAAhV-H5fbyoMk9XWsejU0zVg4jPq_t2PT3ODKiAnc1LNARpBzA@mail.gmail.com>
 <fed0bbb0-9c94-7dac-4956-f6c9b231fc0d@loongson.cn> <CAAhV-H5_KwmkEczws2diHpk5gDUZSAmy_7Zgi=CowhGZN9_d_A@mail.gmail.com>
 <e53a4428-7533-61cd-81c5-0a65877041fd@loongson.cn> <CAAhV-H7QKBEV_dSfX8nprZ838HRCcDt8cziPip4UdSMuYvERzQ@mail.gmail.com>
 <CABgObfaWiNYWFhR5528=3_1RBqTwTDqNpBHDRbvkd-9UyrCDpg@mail.gmail.com>
In-Reply-To: <CABgObfaWiNYWFhR5528=3_1RBqTwTDqNpBHDRbvkd-9UyrCDpg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 21 Sep 2023 15:30:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6YormmC7DC4Ar9Rwu16OHKP0G8+=7eShxkWjjQ7kq5mA@mail.gmail.com>
Message-ID: <CAAhV-H6YormmC7DC4Ar9Rwu16OHKP0G8+=7eShxkWjjQ7kq5mA@mail.gmail.com>
Subject: Re: [PATCH v21 00/29] Add KVM LoongArch support
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: zhaotianrui <zhaotianrui@loongson.cn>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Paolo,

On Wed, Sep 20, 2023 at 11:23=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> On Sat, Sep 16, 2023 at 5:17=E2=80=AFAM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> > I can test now, during my tests I may ask some other questions about
> > your patches. You just need to answer my questions and I will adjust
> > the code myself if needed. After that I will give you a final version
> > with Tested-by and you can simply send that as V22.
>
> Since you are preparing yourself the v22, you could also send it to me
> as a pull request.
OK, after Tianrui sends v22 to the maillist, if there are no more
comments, I will send you a pull request after one or two weeks.
Thanks.

Huacai

>
> Thanks,
>
> Paolo
>
