Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0427A643
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 06:40:10 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bi36so25724377lfb.8
        for <loongarch@lists.linux.dev>; Tue, 07 Feb 2023 22:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rioQaHBJKgU5h2wt1ICSVdRiaXNLiRM7oRrhkkGAa5c=;
        b=isCFkc5u2uP2ClQCHSVxO+0KSCLP+cRrVZ52mMTmEbBq20Ijdy+nFlkUtWzi8WnCCT
         m0PyotMq0LIE7d9S1ePfQpOzGMQhEBLiWu1NIyq+GdbVF2xXwO7FRWkJcbnIV8mE2EQ2
         ebyK3MvjgII3onh9IHYOEUj4JBla6YzV3A/YB+P7bK6W2l5ar71HcPevB1NbAVlKvZCX
         jfFvrFygrMqIbxwaJ6TnpeMgDJQrYxWwvrTdF/taQgwy74UqwOfW1dstAJJ02PsbqszU
         tOMhn7vpAqrBvp5NKL0tM/MiqR0lKZYu7j6e0vrOBWbS76UlATnUw3DGi0p1QS5ZP01y
         g0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rioQaHBJKgU5h2wt1ICSVdRiaXNLiRM7oRrhkkGAa5c=;
        b=W4RxcqGarZi8hkrE6b1bn7Nj2g2+Cm+HOOE02xVUQAo4+Ut6cVb2PVF4sDYXkk/uwL
         lO1rf3gxLTKROzB472ylWFWgNf26+93ZjEPZFRQQvy+JgQOjWWSqB0A3ufYPAeYOeNG3
         yuVZzMMkiPTO3Zd5Uf8XmdJduy7qoaItrmOzUPsimE1GPVluyeD2+lZIfPgnBjxmZKvL
         86Gppy3cuN9X1drxVIf94QcoJt6xPDXoK0MIRpgKmFo1l6156a2roNZGfjjroMZc7saD
         XlWD/tPWjIIms/6sudFKERHOgwWqDWBwKHkswmyKPMnRU1avuNcTQnUt3z4cEbDE1UUm
         +X7g==
X-Gm-Message-State: AO0yUKUuN2sruqTd1Gz1XQIz7XdtpAsgJR7/XnjND+/DiIwHrbdduXPs
	xkAAgBM1nhAKFODbG2tspqoAEIqcbCbKaDxXe6Q=
X-Google-Smtp-Source: AK7set/mqzkeoYr53Z7E6apC4zDRNLOyfSapa311XsyR+Gg5X+L4H2y1ooOKo08B740E4Ed6TWRdf9iF3s4MyaKiZgI=
X-Received: by 2002:ac2:5504:0:b0:4d8:5895:a6fd with SMTP id
 j4-20020ac25504000000b004d85895a6fdmr727477lfk.273.1675838408910; Tue, 07 Feb
 2023 22:40:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675734681.git.chenfeiyang@loongson.cn> <2d77fe4e895847ae1ea09088dcfa411ce2f57f5f.1675734681.git.chenfeiyang@loongson.cn>
 <Y+Mc37ACt0PUBRAQ@1wt.eu> <20230208043440.GA3164268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20230208043440.GA3164268@paulmck-ThinkPad-P17-Gen-1>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Wed, 8 Feb 2023 14:39:57 +0800
Message-ID: <CACWXhK=Jk+FsJ50mc2KFkFYMb9P1BXGv1D4dR=_M1gymqREpiA@mail.gmail.com>
Subject: Re: [PATCH 3/3] selftests/nolibc: Add support for LoongArch
To: paulmck@kernel.org
Cc: Willy Tarreau <w@1wt.eu>, Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org, 
	jiaxun.yang@flygoat.com, arnd@arndb.de, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Feb 2023 at 12:34, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Feb 08, 2023 at 04:54:07AM +0100, Willy Tarreau wrote:
> > On Tue, Feb 07, 2023 at 10:09:42AM +0800, chris.chenfeiyang@gmail.com wrote:
> > > From: Feiyang Chen <chenfeiyang@loongson.cn>
> > >
> > > Add support for LoongArch (64 bit) to nolibc selftest.
> >
> > Please also mention in this one that the makefile was reindented with
> > no other change than adding entries for loongarch, this will save
> > those reading this patch later from checking that the rest was not
> > changed.
>
> I like Willy's suggestion, but even better would be to put the whitespace
> changes into one commit, and the code changes into another commit.
> This makes it a lot easier for reviewers and future nolibc developers
> to quickly and easily see exactly what changed.
>

Hi, Willy, Paul,

I get it now, thank you.

> And one of those future nolibc maintainers just might be you!  ;-)
>
>                                                         Thanx, Paul

Thanks,
Feiyang
