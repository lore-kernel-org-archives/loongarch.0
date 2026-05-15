Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13AE3D412C
	for <loongarch@lists.linux.dev>; Fri, 15 May 2026 04:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778819389; cv=none; b=lRHe4hyDVARiajO+O26cjidzeLznsjvdfm6+QtOvouZ0iS5af7RUQuGZwMLYNWZumq0h/2l3EgWKPJcgCW4D1X4wc2qHogsGVpj4JoJUgM2Qn0ENn9qij3j6ANWJc1DZUkaBbqX3JX+hUCtADQ5knQCOG4R+x1LjcbicJPmn5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778819389; c=relaxed/simple;
	bh=977TUyUUO0sJRJj8yDYIuzP6B7yMCuyIyr7y1e9rzUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMQ6QkzkEQW+e1ArxU2DFFJnUMjSZ9vBP1q9j/G0IRs5YYI4KkZ6SsbyoaBsDxEWfi6PbswpVUfSdEqwuWj/gd3njQ8YNbsQKvXwTGUSR19/rxqHBQ37+DhFFRO/VAJZTyncf9tYdSLADiFVYF3rSgNH36Jr+BLthMD1rFV0Kcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLGh6xcn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLGh6xcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4A1C2BCF5
	for <loongarch@lists.linux.dev>; Fri, 15 May 2026 04:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778819388;
	bh=977TUyUUO0sJRJj8yDYIuzP6B7yMCuyIyr7y1e9rzUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SLGh6xcnqn4Ix0onVGt+BotA9LIGkP0fHjcg2MjkkTexXAkKkwM3Utppey/n41pw4
	 Tkt2oc/SFlRfURI2o5vJYlZo8z8lQvvYclOnqIz06qB4w9yDclzMHZHvP1Fn3MPn+s
	 n40jFZBsTN+uewu1ma9pdo1LxsF6qpyg+xIa3jBSwSc4HF1CX9pwvhUEqdSYH+HQO1
	 CuMFtbwUn8ZZd4IwChYwFmSX41idlxt6V9pWtdrZFI35WMbR9e8MRvmt5JxrNM1o5T
	 sMiqrsDXico2+GnNBsIw6LvAo//h494npNAAlzbuqyUK7/mSEK82YjHZ55+SJ3xsV8
	 zi82Uq5xXdu4g==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd2087858c4so669872966b.0
        for <loongarch@lists.linux.dev>; Thu, 14 May 2026 21:29:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JI5G94iE1H7OFCqzdSezEFNilgZsF0s/7ZkIjGX1o0loduaJ2YmPdjLjnUlv1qJHUBFQhhW9oaYs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+rOpEBKH2GGWZ4ak+VUgquCiyq1gnzKQh5md4nLd0AOyViGVM
	iY9ctpKcRbbTRH+KxnQ0A0vKDXBADJPLltv6TKcZh492C5pFirabcX/dCWQXc/C0zDGDMr2/bB1
	LkIqHyNaRV28wOKNrWwe2nwEybI58AE4=
X-Received: by 2002:a17:907:97d2:b0:bce:80db:77ef with SMTP id
 a640c23a62f3a-bd517970663mr108233666b.43.1778819387263; Thu, 14 May 2026
 21:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512082029.2131-1-yangtiezhu@loongson.cn> <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
In-Reply-To: <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 15 May 2026 12:29:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
X-Gm-Features: AVHnY4JApl1D0el-Yea2XuiA2EIRgNUVonLTV5spNFvVXUyWALhIcgqPZOaot7Q
Message-ID: <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:52=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 2026/5/12 =E4=B8=8B=E5=8D=884:20, Tiezhu Yang wrote:
> > This series addresses ftrace and kprobes issues observed under heavy
> > tracing loads.
> >
> > Tiezhu Yang (4):
> >    LoongArch: ftrace: Fix stale per-CPU kprobe state after task migrati=
on
> >    LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
> >    LoongArch: kprobes: Fix single-stepping instruction slot preparation
> >    LoongArch: kprobes: Fix handling of fatal unrecoverable recursions
>
> Hi Lisa and Rui,
>
> You are right, please ignore the patch #3.
I think Patch#3 is OK, but you need to remove the introduction about atomic=
ity.

Huacai

>
> Hi Huacai,
>
> Please disregard the patch #1 and focus on the patch #2 and #4.
>
> After thinking it through, it is better to avoid calling functions that
> might sleep in the probe handler. We have modified the test module with
> a proper way, there is no problem thereafter.
>
> The right way is to prevent the problem at the root instead of trying to
> fix it after the fact.
>
> Thanks,
> Tiezhu
>
>
