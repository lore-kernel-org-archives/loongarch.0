Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81A945005
	for <loongarch@lists.linux.dev>; Tue,  5 Mar 2024 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709622536; cv=none; b=k9/BtpvZYq7dhEy1sQkyYzw4RRPBN5fA2PHCHuoccuetAkG2Ib0lr0jN+Qbvt4WhCzYO7pssR4RxfaP06MPJAiDSxyxgLXm9FdJSA1PapgExu4PvYy26AtL+MogHaAgmJlkN/aMAiUxZAA5B5ztheHQ0aNVb1t0LwuLn/qQiM3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709622536; c=relaxed/simple;
	bh=Z2qwct6XTybj5nj/8GILqcSdKhOgcrszVOS6anSnpTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEF4AiT28W2vnEXQn1TGmim19xPn/xzqeyGNKwbpUqBIJDq9LoQ6jrImL1JdojViC/E/oCgAePOjxPuPBLdh711XI4KYfOIk5gw6ekFEuvjeD7Qv5jB7lbZxvaO2cWtdfGFf0EopNl0Sr53lTDFsrfdCoe6rl0e/Ulyv5d73pUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.219.181])
	by gateway (Coremail) with SMTP id _____8DxK+kAxeZlaaEUAA--.33270S3;
	Tue, 05 Mar 2024 15:08:49 +0800 (CST)
Received: from mail-yb1-f181.google.com (unknown [209.85.219.181])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxvhP+xOZlmF1OAA--.22255S3;
	Tue, 05 Mar 2024 15:08:48 +0800 (CST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so5155036276.0
        for <loongarch@lists.linux.dev>; Mon, 04 Mar 2024 23:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJooNDv86DIhjnsGG1UCCDs+9ee230oD7m6aJhQCk2yJpC3f7iSpRxbCrs50QwWLWg6BBa72KJkKqJsCoV9z9rni5DrpLDtsqE
X-Gm-Message-State: AOJu0YxTGuN2O+mkuen8/ORppKJXg40Dh9NOk7xwufR3EyAOu2Ss/AqL
	HURlN2RJ47xtBCFDN0yOcsB9xxgV2bpOOoPs9WPx5Fg4Fa6E3dg6DYUVgxcIKuyo/OX2yE2cs5K
	x35ydI4uX2RiRMP31Bd0hki5UDFVOJbfhQ5XIVw==
X-Google-Smtp-Source: AGHT+IFCOgUQy6Yrg/hGm/YPDL5pf6cIPrfQwg8VzhOdB0PFiQXbjuVLpWWugLmSn2Wclxftxj3A7UzLgXYKuu6Ie90=
X-Received: by 2002:a25:1803:0:b0:dc6:aebb:168e with SMTP id
 3-20020a251803000000b00dc6aebb168emr8119664yby.26.1709622525779; Mon, 04 Mar
 2024 23:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240304141426.163517-1-wangrui@loongson.cn> <CANiq72mvdVrzN19PC8pNrvuBLkOEEQ3yX0WG6JcWc+RVaSM2nA@mail.gmail.com>
In-Reply-To: <CANiq72mvdVrzN19PC8pNrvuBLkOEEQ3yX0WG6JcWc+RVaSM2nA@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 5 Mar 2024 15:08:35 +0800
X-Gmail-Original-Message-ID: <CAHirt9iNPjHfMRS792E1MHbCQk1v6GnNVcb6LAvhskyyVg8bPw@mail.gmail.com>
Message-ID: <CAHirt9iNPjHfMRS792E1MHbCQk1v6GnNVcb6LAvhskyyVg8bPw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: rust: Switch to use built-in rustc target
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, WANG Xuerui <kernel@xen0n.name>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8DxvhP+xOZlmF1OAA--.22255S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtryxWrWkCF48Cw13Gw17urX_yoWkXrb_X3
	W7Cr1kGF1UuFs7Za48JrWruFn0q345tay3Z3ykXFsrXr95Zan8WFyDGa4av3Zay3yxWFs3
	Kr1Fvwn8uw12gosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU8OyCJUUUUU==

On Tue, Mar 5, 2024 at 12:09=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 4, 2024 at 3:14=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wro=
te:
> >
> > This commit switches to using the built-in rustc
> > loongarch64-unknown-none-softfloat target for LoongArch.
> >
> > The Rust samples have been tested with this commit.
> >
> > Signed-off-by: WANG Rui <wangrui@loongson.cn>
> > ---
> > base-commit: ("rust: Refactor the build target to allow the use of buil=
tin targets")
>
> I couldn't apply it on top of commit f82811e22b48 in arm64's tree
> (which is the base? -- the offset differs significantly in the arch
> Makefile), but I nevertheless applied it manually on top of that one,
> build-tested it for loongarch64 and boot-tested it for x86_64:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>

Oops. The actual base is tag next-20240228. I just want to make it
clear that this patch needs to be based on ("rust: Refactor the build
target to allow the use of builtin targets").

Thanks!

Regards,
Rui

>
> Thanks!
>
> Cheers,
> Miguel
>

