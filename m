Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F51E25E3
	for <loongarch@lists.linux.dev>; Fri, 10 Oct 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069382; cv=none; b=UAjzgJdmxB/3f84GI0mv5fJGNNcGMAcAFkQdhelFTw9OlApY/MPHGcl1E/WvWmDvTOVZ+mWAgNqpfjaTaOyYFYERKQCnGqShPn0IOrs725M+/3/Gyu/sXauhVW5wasEzKsIjokg2F1AbQdU/9TLItAPJKI8nRLhqFJiCQxEVz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069382; c=relaxed/simple;
	bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDGmlHw8OTcWu2JZzP3boY8EIydOy5T5UGmD95Zcuw2yOifvCU6bACGvRcXutFLx0yRZqUjLhiDJeEiZw24XtX53CFW8XYEgqRvBk/uaQmR6GWH/g7m5WNkQpmykEcQOX1VPD4SaAXhA7mZQjCe+qYOl72t9DHzsS227vc/+x9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNy5bENw; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNy5bENw"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d6014810fso16485917b3.0
        for <loongarch@lists.linux.dev>; Thu, 09 Oct 2025 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=BNy5bENwT91Khf0uzBA0w6xbJbnXrug6gdAPf0ANt5YEg2mYPko0STmLZ8NkX6MyWn
         CX1x2QtI5CQGruWcfbNoyDRTF88xXU+OunJBuGIkRKcqv5BLvtYFdro8MAZpkgBEFlXC
         QfTSxI7lJ6Qt3H8zXBHmCPnlKxVv+kNXVOPF92j7utgYlVm9BCwiRx0+sec4ahksZnqS
         pgmc/R+MvD47v2DZwK87MaMWw0xoIq7/UFr/3obPf/5V2sJyiwhBGaPlQ82Lb7XbbHUp
         zyl1bJ4KUAMF360kls4gJFDeCnnNzgZFK1zxjSXhqs7/kdIrOvlmSNzeGNapKmSequb4
         KZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=OIzr+nGx/opN0UKdXOHWwPfl092GZFhZt4h1txm7QkpxhQIrDSr0GRtjuUO+T726tY
         q17miov0IkbyEBPoL+6AeACF0fYnQG5JHqETqD/X9cn0pBzI4YgwM3pNbDHUROp2eUqw
         e735HVc7iAoGTvh+YaaX6EGzagq4EAuGb1ZshHTW5isF4ZbASuCiItm+bKA24JaemPHj
         xbGXxNBCGNtSfNeH8vPNjswSh1S7JVcENGMpobn34HzErnuoo8SrV73MeYaL7GyUQQQ1
         NENAbxKESAPRcgqqWD3S411NkiF43L3CMik8Ken/Ag/CWUWRXdakA9Ch5iRQBvzof0MT
         qGig==
X-Forwarded-Encrypted: i=1; AJvYcCWbQEHZe5iuNEoZR9YfjWpeeefOHFr6FMdZx+rY2wYHMFvds5otZX8glr6BoViihIfae6PSv0pqR4k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylj0eKYM/Bl0IBO97pr4iFIuUfxwUPkzJJKL7U2t1xG83sk7F0
	gLg4SdgvcwNuxU+PG0OzUp2GznbrY1PxpSSf0aJGoxr2N1njJOQwkF1vIQua21z2DPydxa3F5sF
	Wh/vb7gCNjm6jZNpNA7sUbZdq6QUDgAc=
X-Gm-Gg: ASbGncs+VX4GbGOpXUBzl3eu/wFXSASLerosySFbSzuNu34HIPg3dBzueFSkq/mVdtR
	h4lypsQps/42sWw08yyHOJ8Yu7a5izvu9NnC36cPBNNYsckY2/4iXCnToIDal1Ic1cTzcCRnYRd
	39J1sVRLF8rjYvurAp7SktfJT164BON8R5hMHTFijg74592CnUVfdfy632+xjQQXo4kMVa11DTE
	Yt1DSsj1FV6BiSfm5XSG0AC6e2lwkS6esQd
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 8:08=E2=80=AFPM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
> I strongly suggest picking different names given __builtin_foo is the
> naming scheme used for GNU C builtins/intrinsics. I leave you and
> others to bikeshed that one.

Thank you! I will fix this.

--=20
Askar Safin
