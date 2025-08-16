Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA12F39B9
	for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755356402; cv=none; b=rqZrcyA0DGe361sykpVk/h9S7/jc4+jzTVYMzIh4ddyPutRv4vI/s83NsASCsDrIHgMXm65UIA1IsdJsPtiWEFcgc9si+IbjhouJcSYD6t3xy/1GK2WI5YcGXubdAYanfZuyTExkuGcuomlhde70ysVRz9lquVERVEm5waI/rEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755356402; c=relaxed/simple;
	bh=Dg0tupBMCWXZvMeUo/PdfXgVzUQJ76yoyPAUfImiaP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e37h5JUxDfUt62/3Woc1kLtTT5ESwp93uC/jOFElEe2dbaiwfr1GCN7qzt0F7lgDHOTb3jZLQN8jh/gTqWfnqumruWsaTHsNygTNolF3rmsy2VQyur7pyyp7o/Fy3xbF7gLzJSTeI/mi6kXNyQeOb4gOboz1qfYXLz83Gjn8GWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYXEZqNP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYXEZqNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A75C4CEF6
	for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755356402;
	bh=Dg0tupBMCWXZvMeUo/PdfXgVzUQJ76yoyPAUfImiaP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYXEZqNPk3Q/vbFMRzz1+Yu8JO37kyAumgfoezU//EagTtTOMNUFznBPBzXL1HUTJ
	 gg97iBMdxWEQ8fP+Xzc0jupTVC4ksg2zhYlnUyewipzUBgyELXWR/tTicd15TbDcvG
	 L2kGJu1k2/0cF3P3oVt1XcH77J/nbcNFXyp3Ip9WXSK44WXH80zxgPQvaRLbDbHKp1
	 QYOcD2FNYsV0NI9whBjdjTzfY7wDJhM8XoD4KFfye2s5FTGTT8WpzVN4f8hve7lxrw
	 jboQOA30YqtKe7mQJO42/jqgHOIR/K6Z0ucrQnP1MNv4rpQanPK0kJ75pgPheDa2uN
	 u+dmy3yyjdydA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-618b62dba1aso1641506a12.2
        for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 08:00:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpuyxA7zMCYMOwdKvdgEw92b1Mba8FqUOiq+t3pLBCPBvwQtcvGpVm7FXuKebxISGGIgF7hO/gRhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YweAEv9S3boKaE+B5vfQbpsahbFj0DdfJWL5Kf+xZ8ShUskreUW
	MkbcpmBsUW+WlPSqijDdj7Mdl4UEzoAZfIN2d+FUvi5s+tTP7CjDDlOhHWxYs3X9MnAGWukND9Q
	13zrjeMkZqJ/jAMyPY2o10noRtyWq9Zo=
X-Google-Smtp-Source: AGHT+IECnCO55i79Kgc43l0bl85Rl6To40Zyg8ZcGSNx4QYSd2Z54t6C3SfIL5mUsQ5wSr3hvAKYqt3mY0ZO7xBVd2Y=
X-Received: by 2002:a05:6402:5203:b0:618:7585:be41 with SMTP id
 4fb4d7f45d1cf-618b075995dmr4721080a12.30.1755356400040; Sat, 16 Aug 2025
 08:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812132716.1465-1-yangtiezhu@loongson.cn> <20250814230137.GA2247447@ax162>
In-Reply-To: <20250814230137.GA2247447@ax162>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 16 Aug 2025 22:59:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pYKb9+XUZW4QNWiMQSZVBBsVSvDNB5RvKWnxFEC-gcg@mail.gmail.com>
X-Gm-Features: Ac12FXw8N7Fq2YnX66Nrc5w2AQRwib4_hamW0XFD2Bp20kAYjgKC3cybL8zrf7I
Message-ID: <CAAhV-H4pYKb9+XUZW4QNWiMQSZVBBsVSvDNB5RvKWnxFEC-gcg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix objtool warnings if LTO is enabled for LoongArch
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 7:01=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, Aug 12, 2025 at 09:27:14PM +0800, Tiezhu Yang wrote:
> > The patch #1 should be a preparation for patch #2, that is to say,
> > the patch #2 is dependent on the patch #1, otherwise there is build
> > error if LTO is enabled after only applying patch #2.
>
> Thanks, these two patches do indeed resolve most of the warnings that I
> see.
>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> > With this series, most of warnings have been silenced, only remains
> > the following warning by now, it needs more analysis:
> >
> >   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel() falls throug=
h
> >   to next function __efistub_exit_boot_func()
>
> Yes, I do see this one too. Odd, as efi_boot_kernel() ends in a
> __noreturn function...
But this one only exists for LTO?

Huacai

>
> Cheers,
> Nathan
