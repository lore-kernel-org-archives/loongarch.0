Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9481D6119
	for <loongarch@lists.linux.dev>; Wed, 17 Jan 2024 04:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705466082; cv=none; b=awhT6zenH4Ei49KaVHQIutjsqXQCLvRqNc3ZdU/OjBYvze+1+XT+31ZP3NcSKBsSBhElM4We761PlBhG9CM0lK+CEbuG/8I+C0hEAsWu1nOp9YdMPEkAfA0+bZhExLsF4e4iIxoPa6o05R4/+rPq+qboENARLT166VIQP7xGZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705466082; c=relaxed/simple;
	bh=M0lHeEIbJSP8UEtQ7BzZHEeSSX3emAVPVhi6TmOdTmw=;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=KEVm/co7CK6x/GXGhUtYcIiIgMEaVN4Py2N9pPZom0bJo17HD5o0Ag2kLw82fvEMTK48gTA6z+xh0y9lq/eOyYsYB5YzqqHHySPfbnqKfnv2ZDjjhX8Ad9WunL/I9PTxNkePZJMr0rS1gatRqysrdBU4pYEtHFs7tueqQOnxxZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXDf1qJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXDf1qJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1227BC433C7
	for <loongarch@lists.linux.dev>; Wed, 17 Jan 2024 04:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705466082;
	bh=M0lHeEIbJSP8UEtQ7BzZHEeSSX3emAVPVhi6TmOdTmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CXDf1qJbqvdXoXU8dg7DU5ubXNQ7WNA9aX1ilbJscd7JrxbkXjjJ/HkYslSojP7d1
	 SZty9DEOw32ezbbNxF1uFPxjBzR/Wk3CVNwrHoczaPtWfKBvj0P1kMS5myspvnTFjf
	 WvtyjclcPMdCfaiHDMBhhyvKGwUYf6S1WjXYQvdTiC6XQASQ3KPr06lNk6qZdOYGYm
	 qEQIjWXFHn9Ra+7yDAzNkgQYljtNGaH9N7vuTmBRwFS0aJtgKsazR6yryDu0/AUPlB
	 7xL51I82l02yVMBLdlqOYJIFbcFTVuS10ISG39hTPjNxGTEJwtwma608nNzZ901cT2
	 Z16Gv4+XL9t8g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50ec948ad31so10564126e87.2
        for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 20:34:41 -0800 (PST)
X-Gm-Message-State: AOJu0YxedgZ9mEKYd6BBlTnY8eHpPGeL2Pt9gXqMVsi/G0+fEtgMng3w
	OFzFuFo2GwUYMVZ8gc+yG2KpMabaJgL78sEQrIU=
X-Google-Smtp-Source: AGHT+IFBqnMfUgM4CRX5wiiomwTy15C6kBIJjo72WKWNLc+dQEyC4hkYoiqfUivkJJafe+zfYxjuMnrYThXWHtq4MnY=
X-Received: by 2002:a05:6512:3a86:b0:50e:7d6b:b5b2 with SMTP id
 q6-20020a0565123a8600b0050e7d6bb5b2mr4765644lfu.6.1705466080318; Tue, 16 Jan
 2024 20:34:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240108032117.215171-1-wangrui@loongson.cn> <ZZ2fn0scbDKBXWe5@boqun-archlinux>
 <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com>
 <ZZ38XMQw18mw2sTA@Boquns-Mac-mini.home> <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
 <CANiq72=X3cggAn0HLMi7jVFAfypBhog=ZkPB57yfaX4ZUzT-HA@mail.gmail.com>
 <CAHirt9hdtGSsEofxDb0FCtcFeAw9n9LKJALz23Qdqh4n2=Ua5A@mail.gmail.com>
 <CANiq72n7K8LcKrs+beF2sbt1XLdr4zEhEw4xcy3yh4wgTrvYeg@mail.gmail.com>
 <CAAhV-H72Hbfy7n6+AFSFFOzizo0GtpzA074sgo48-W-Dt0VR+w@mail.gmail.com>
 <CANiq72mEPnB7yEZvtUXAM5w0GgYmzdrM9OhioLGb_LzbAJKNOA@mail.gmail.com>
 <CAAhV-H6BFkgN-KzEexXk9zdnOGNCdBesCEEaczEvEp8x2K2YHw@mail.gmail.com> <CANiq72nv3Uw8GLNqbdGBC3b+viF+o8BeppS9KWhpzBFvjqZLUg@mail.gmail.com>
In-Reply-To: <CANiq72nv3Uw8GLNqbdGBC3b+viF+o8BeppS9KWhpzBFvjqZLUg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Jan 2024 12:34:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4-dfBN3icg6kczRiZ67DOX66M-vXXCrz7Me0iunp8kRA@mail.gmail.com>
Message-ID: <CAAhV-H4-dfBN3icg6kczRiZ67DOX66M-vXXCrz7Me0iunp8kRA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Rust enablement for LoongArch
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: WANG Rui <wangrui@loongson.cn>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Miguel,

On Tue, Jan 16, 2024 at 11:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 16, 2024 at 10:31=E2=80=AFAM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
> >
> > OK, since Linus said the merge window is paused now, I rebase and
> > retag my tree and the Rust commit is like this, I think this is
> > perfect now?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongs=
on.git/commit/?h=3Dloongarch-next&id=3D706f9e1ab7c7a58d80ef2c87d8720131253a=
2256
>
> Thanks a lot! That works, yeah.
>
> I also took the chance to build LLVM and QEMU and I tested the tag --
> it seems to work: I see the samples (built-in) printing in the kernel
> log :)
>
> So in case you end up rebasing for another reason and want to add it,
> even if it is a simple check I did:
>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
OK, if Xuerui updates this patch, then I will rebase again.
https://lore.kernel.org/loongarch/CAAhV-H7KteJvRVpj3Hz-Ui9VnmijcJq5D1Tb-KJv=
qTO_+jjp2Q@mail.gmail.com/T/#t

Huacai

>
> Cheers,
> Miguel
