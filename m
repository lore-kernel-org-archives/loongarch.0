Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44545040A
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618609; cv=none; b=fvhgSQV6XcU3qVaueZRGyz+ITu9RX/v5KfPVLoz/kG9tbLo/fDNQluQNoh2VOjqnWSbXGPB9PlpqibDnFfQb9tslKxFyXIW3x8uDVAjI0rvTZ/MJ9vv4Vw9YBThf6Qg7XnynY99OHe9NZO6QO+/lLN17eA7QNL/eNLGhe0Alml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618609; c=relaxed/simple;
	bh=0GT5iYAcKItMoHnQRHrP7zSBks/T6rSPojR7jjlqufU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9Q9dNd5UormWB152OLCn2atbjdFR5we1k4ZvCTnOobiJTZ3vZgSgNML18RH0q04WqZjuYZZ42Bv+QmuIK4sRT5AsE+g27aSzqf4se3/oejk4V7Xx/2Ccdjq2v6J/rLhPbcC287nYhJ2/O8fQCvsSyxpRhsfh/9sB8UVwUnKwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALAFM78A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALAFM78A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717541F00A3D
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618584;
	bh=0GT5iYAcKItMoHnQRHrP7zSBks/T6rSPojR7jjlqufU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ALAFM78AevWHaRwedDuynxND2mfW0S2ZtwjNLJBQMZb4WwmFnw/1yWh8x9nirct/h
	 qgQInzUdmkTJy/xZ1sKe6maxVueIc0T3iw+/uZH7Kg+DUx5YxafOv2Pjc4TztOVMjE
	 k1CvHhrE4p+QgMdB6kzqnq5uLO9bBmhtr0aZzJX7Mgi+DrzHz6WcQ+pPucx2QfG4k5
	 KwJ7xONvEqrDlfiwBJrwyRrDTMcKoh2ivXU3b0B1oa7Qs5yopV7uV7yPKA4n2HVCid
	 qo7oEHgoNEwYXgnvza0xebStiRg0rHZoxSqz43OH0kr4O2VG7sE+a6pCPltNjhhmNB
	 XXNU5PMLm77cw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so1095723a12.0
        for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 03:56:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMUEfvjBMxzJNwyQ/RehrfU2CkzuUyBCbdTmOEnWoBQe3allS9
	Jr5GfEAaUC3jsUdwmswbLKpoFawVSkjNTovkX5y/7hKtl2Zxf17vvCvtR1reuTMsFXjVHo1KNgo
	ZD0IpIZnRzkS54Vw7e3QaFO5tyUxa2lw=
X-Received: by 2002:a05:6402:52cd:b0:6a3:691a:9d71 with SMTP id
 4fb4d7f45d1cf-6a38061b080mr2216048a12.11.1786618583124; Thu, 13 Aug 2026
 03:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813090506.15574-1-yangtiezhu@loongson.cn>
 <CAAhV-H7wh+8E1HEG2tAwg=7MEa228oTHRKKKqMA6wDJc4vFmZw@mail.gmail.com> <0de41ba9-ad21-85da-bc90-54e0f4698b9f@loongson.cn>
In-Reply-To: <0de41ba9-ad21-85da-bc90-54e0f4698b9f@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 13 Aug 2026 18:56:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4zep4eLMhgvy4W94L=yv0_L4Okx2NTYiza8Z_uaTj5pQ@mail.gmail.com>
X-Gm-Features: AUfX_myCzFC9PdqxfqeswgXKityQtP7xG4pDBYKB6RQg54NaStcHi8nNOVBhb-0
Message-ID: <CAAhV-H4zep4eLMhgvy4W94L=yv0_L4Okx2NTYiza8Z_uaTj5pQ@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Use current_stack_pointer in current_pt_regs()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 5:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/8/13 =E4=B8=8B=E5=8D=885:32, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Thu, Aug 13, 2026 at 5:05=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> The current implementation of current_pt_regs() relies on the compiler
> >> __builtin_frame_address(0). This introduces an unnecessary dependency
> >> on the frame pointer register, which forces the compiler to generate
> >> redundant prologue and epilogue code, create a larger stack frame, and
> >> perform redundant memory operations to preserve the frame pointer even
> >> in functions where it is otherwise unnecessary.
> >>
> >> Optimize this by switching to current_stack_pointer, which explicitly
> >> maps to the hardware stack pointer register. This allows the compiler
> >> to compute the stack alignment directly from the natively maintained
> >> $sp register, completely eliminating the overhead of preserving and
> >> restoring the frame pointer on the stack memory.
> >>
> >> As a prominent example, this optimization significantly improves the
> >> hot-path function copy_thread(). A localized disassembly comparison
> >> of copy_thread() illustrates the elimination of the frame pointer,
> >> the reduction of stack frame size from 48 bytes down to 32 bytes,
> >> and a more compact epilogue path:
> > 3 instructions and 16 bytes stack space. There is improvement, but not
> > "significantly".
>
> I used "significantly" from the perspective of hot-path sensitivity,
> but I agree that 3 instructions and 16 bytes might be inaccurate.
>
> If the code itself looks good to you, please feel free to update the
> commit message as you see fit when applying.
>
> Alternatively, let me know if you prefer me to send a v2 with a more
> accurate description.
Unnecessary, I will modify it.

Huacai

>
> Thanks,
> Tiezhu
>
