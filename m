Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814A6107
	for <loongarch@lists.linux.dev>; Sat, 22 Jul 2023 02:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F17CC433C9
	for <loongarch@lists.linux.dev>; Sat, 22 Jul 2023 02:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689993548;
	bh=+RqEIaoI8OE5D71pEAjzNeOQhQuC/8XCkx88Si4hPEY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lHQLpKIy8JpBgFyrPafh3ZlCMAmb5NNqb2ChqP4Y9lwUnc+xW615GHHbGgFaN9DdM
	 Wfjiq/dhrF4dkEkqhY29ZE/MZFb3/YeujDuynCH9Q/ZOIIbNiSMU6ab/wOh9kPMPV2
	 f7KdLyio6uZHl8BYcx/ZeKh9Xt2a16sgS47pD/TCFMKTPZt/ePJyNnyeszgE1lCefD
	 vPZ2TZ7QPtW2kCprDEer5hTvx4eUDDS0ITZ6Ea1CH1MrZbJbX7x8rKVzSpsk+TIeh5
	 F6Y0iyYtviuDa0mV6/YePJr3rCFVLJVStSUK+JcnoDc4TtACYD4k7/1smzI40w2mGK
	 iHzT9OWWB0g4w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99342a599e9so400092866b.3
        for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 19:39:07 -0700 (PDT)
X-Gm-Message-State: ABy/qLbFTD3M7U6m3KUtKThz/4aFQ20nzwiF+tWTYs7BS68eUaVCQnqm
	ie1EpMGYtOHER413JTTWmXGRK3n5iraHL3xuYuk=
X-Google-Smtp-Source: APBJJlEG/RmL8tu3vSMZ8UlWQ25SvxEDikE4JTHxKsNUTT0esW+CutZqjvYr2T0viznIahAjE4tSh9FlLngWD1otfuI=
X-Received: by 2002:a17:907:2cef:b0:99b:4a6f:9c72 with SMTP id
 hz15-20020a1709072cef00b0099b4a6f9c72mr3709167ejc.72.1689993546316; Fri, 21
 Jul 2023 19:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edl6wr9p.fsf@meer.lwn.net> <20230717192456.453124-1-costa.shul@redhat.com>
 <87tttxc9tt.fsf@meer.lwn.net>
In-Reply-To: <87tttxc9tt.fsf@meer.lwn.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 22 Jul 2023 10:38:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6K3OOHxYxxTWDDN3FiJ0zQd4H2b1zBPhmNHpBekkPbAg@mail.gmail.com>
Message-ID: <CAAhV-H6K3OOHxYxxTWDDN3FiJ0zQd4H2b1zBPhmNHpBekkPbAg@mail.gmail.com>
Subject: Re: [PATCH v3] docs: move loongarch under arch
To: Jonathan Corbet <corbet@lwn.net>
Cc: Costa Shulyupin <costa.shul@redhat.com>, WANG Xuerui <kernel@xen0n.name>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Wu XiangCheng <bobwxc@email.cn>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:LOONGARCH" <loongarch@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jonathan,

On Sat, Jul 22, 2023 at 4:02=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Costa Shulyupin <costa.shul@redhat.com> writes:
>
> > and fix all in-tree references.
> >
> > Architecture-specific documentation is being moved into Documentation/a=
rch/
> > as a way of cleaning up the top-level documentation directory and makin=
g
> > the docs hierarchy more closely match the source hierarchy.
> >
> > Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> >
>
> This, I think, is ready to apply, but I sure would like an ack from the
> loongarch maintainers.  As it stands, please let me know if you object,
> otherwise I'll apply this in the near future.
This looks good to me.
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Thanks,
>
> jon
