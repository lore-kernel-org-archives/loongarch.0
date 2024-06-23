Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAFEDE
	for <loongarch@lists.linux.dev>; Sun, 23 Jun 2024 01:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719104836; cv=none; b=X4hwYA9hgynwgA5du9x+cqyfP9xMn65w8Adf9UatnKOYFuqTxuhkVNs7g6VNWcZlj66ZAwuosUEjIIhg/MsC09anxbqCsPdFlNEkslGtubLOR36LnBrjgxvIFyQe3wVxOX5GXocDlGvUfejEXXGRXXpcRYl2EDc0QtiH0ADnxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719104836; c=relaxed/simple;
	bh=ZZNJknkTdLBZBFpwUgKkhf+iI4jrdB1JKtV3x3uiclM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpwspjySziXh5t7jfeUeEv4YjbNs+ixuut0OePmCLeZG9ASCY3m1C5cCxs/ptFhe+GuPkyqKWq4+0K0IrAd82v8cA7hzmJOh+vlziwTeS/2KdBO2OQrlVTNkaQQTYraW8PzDMCVqj08yDiQk41aX3Y/VubTINfaeTlwQ4ZtB1sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBDpmKoZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBDpmKoZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57cb9a370ddso3570154a12.1
        for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 18:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719104833; x=1719709633; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz3vj8Ru0h71cywTegEZO1FBdJypiDlos6TeeTlgGjQ=;
        b=QBDpmKoZUvGV8s3WELM6MewYq2dTqVsOpsp9FcBmmnvK4t3kH612fALiQnLOD+Vpd2
         qEBlhvQHpB0qWz71nqxwE3xP+TSim5bLoijGCeHGCnGrG21pGuqyA+6Kbv7mSVE+qGAq
         FtRg/22v8HKzQYm+kflRk4f8tOQeygHksIwEXd3kff3c/ohSeUZfwvZndL3c/0hkL6Dt
         ytJb1rJahZk7qFCFWepl76ArRoqD/k3bKJxwuCZ1WCuzkY757GB6LkTUimsBcLwvaC+Y
         LKmV8L2EIpS6EhI40dh+A0NEvxdZwtlJjONRdhavCSwlq3AvvXBO06h2R+a5SDBSWJ0J
         w6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719104833; x=1719709633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz3vj8Ru0h71cywTegEZO1FBdJypiDlos6TeeTlgGjQ=;
        b=fHen83rYCJpf10JGrh59aUq00L2yrRD75V6fSQL01Bi8OPtdszaY4I8hRUo0RIP693
         SF02jtHLcTklr2ouj8Pc4jrHbVQHLeCOMBXevp+dBTXTBhe2dUjd0VEXCYAZgBoeB37q
         fWt6KkzNPRLuJRl6GB8XDcHjeQiefySRuGsJ50ZQPlxkTxZOVYP3YmzX5yOKYIEnJnzI
         V5w2tv71B8CoKSLLbeB5zCTplOy7FQpL4TCwV75Pcb/TLOTPywgw7tt+TvRLvcB+ToRn
         sKkjE1Lo7xzKT4yejRcpUurgHYD0vFCS9321WR+kDHNEntTgoeEvN/9XDRftXcaiwhA9
         6fdw==
X-Forwarded-Encrypted: i=1; AJvYcCXcmpIDMjqYCRfJY4CIbiRVQWW58U5D83hbgtedRAgTCr0IRHQp6BxzkNqtwRM9rXIdTAp7/4VFTkhz1eC1qeSWgY9pOzV9+tet
X-Gm-Message-State: AOJu0YxRU2HihEeVHeqkO8R+KgNY79eRQ1l+RCwTAXMfh0rQB9JY1pCj
	hkyMVGnUtgzM++ckw3OAz/aoL2eqSolWvh/EfYd6cI6SYyNA1i0ZTcZY0kueSXOrkaUtuVROlKY
	xukW5IfMAUd1ncfZrlt5XDrq6JnY=
X-Google-Smtp-Source: AGHT+IE7P4o4k2HHIR9WdTfNkROT9btzZqTyxvQoLZjkpdxCJOQkO+1AFHTS6xXPy5qWsgXel1TvLSMI1AuMQ/G83ck=
X-Received: by 2002:a50:cdd5:0:b0:57c:6adf:1035 with SMTP id
 4fb4d7f45d1cf-57d4bdcb3f2mr600321a12.27.1719104833291; Sat, 22 Jun 2024
 18:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240622105621.7922-1-xry111@xry111.site> <kslf3yc7wnwhxzv5cejaqf52bdr6yxqaqphtjl7d4iaph23y6v@ssyq7vrdwx56>
 <CAHk-=wgj6h97Ro6oQcOq5YTG0JcKRLN0CtXgYCW_Ci6OSzL5NA@mail.gmail.com> <eeb7e9895aca92fa5a8d11d9f37b283428185278.camel@xry111.site>
In-Reply-To: <eeb7e9895aca92fa5a8d11d9f37b283428185278.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sun, 23 Jun 2024 03:07:00 +0200
Message-ID: <CAGudoHFofUZ0Nb9UtV=Q3uQ0K+JnBHPrgLxNYuj7nSLF-=ue8g@mail.gmail.com>
Subject: Re: [PATCH] vfs: Add AT_EMPTY_PATH_NOCHECK as unchecked AT_EMPTY_PATH
To: Xi Ruoyao <xry111@xry111.site>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Alejandro Colomar <alx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 2:59=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Sat, 2024-06-22 at 15:41 -0700, Linus Torvalds wrote:
>
> > I do think that we should make AT_EMPTY_PATH with a NULL path
> > "JustWork(tm)", because the stupid "look if the pathname is empty" is
> > horrible.
> >
> > But moving that check into getname() is *NOT* the right answer,
> > because by the time you get to getname(), you have already lost.
>
> Oops.  I'll try to get around of getname() too...
>
> > So the short-cut in vfs_fstatat() to never get a pathname is
> > disgusting - people should have used 'fstat()' - but it's _important_
> > disgusting.
>
> The problem is we don't have fstat() for LoongArch, and it'll be
> unusable on all 32-bit arch after 2037.
>
> And Arnd hates the idea adding fstat() for LoongArch because there would
> be one more 32-bit arch broken in 2037.
>
> Or should we just add something like "fstat_2037()"?
>

In that case fstat is out of the question, but no problem.

It was suggested to make AT_EMPTY_PATH + NULL pathname do the right
thing and have the syscalls short-circuit as needed.

for statx it would look like this (except you are going to have
implement do_statx_by_fd):

diff --git a/fs/stat.c b/fs/stat.c
index 16aa1f5ceec4..0afe72b320cc 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -710,6 +710,9 @@ SYSCALL_DEFINE5(statx,
        int ret;
        struct filename *name;

+       if (flags =3D=3D AT_EMPTY_PATH && filename =3D=3D NULL)
+               return do_statx_by_fd(...);
+
        name =3D getname_flags(filename, getname_statx_lookup_flags(flags))=
;
        ret =3D do_statx(dfd, name, flags, mask, buffer);
        putname(name);

and so on

Personally I would prefer if fstatx was added instead, fwiw most
massaging in the area will be the same regardless.

--=20
Mateusz Guzik <mjguzik gmail.com>
