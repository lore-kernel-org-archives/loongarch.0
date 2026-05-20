Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CFE3A16AB
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263899; cv=none; b=ivGYtt2GlxxtTzxqOZh9YCjOtqFFEQfM6mlHOzdbWzwmcW+X/qMx9OvdjQ+r/By7QGeZeIXYvcvsqj7GZJhUCO2H7ipwUcbaI/E3AO9cibJY29qinEOAjp0dFOfqHyq6fi2tzuudpmHJwIRa163xs9+7kD9B3ABmm8m4syIvOeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263899; c=relaxed/simple;
	bh=N62nCYm7Ehd8BWGl+uNovCHAIKA/q2wXjoz2Wpfrk58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGGpO0oYYDECWmG+iWz3fmRP6GXEeNTf0W6LrouuNQaG8m47+0c5k+41CBtu/fzm/PGxKxp/jrYRI+5bFiVB8JlF7+tB1gp7uEf5pPjzL6EotpAXp7PetGLL9ZCtIyWJDCWLSp+7Qb3wcSGeI/V6Hn/nFpe0PJmzZWGJ9WU4tu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+dA5jpH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+dA5jpH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361741F00897
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263894;
	bh=1XrxY/GcpS7mxJBwM+VDAZuClbSQkw9iCeVdOSwaCPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G+dA5jpHOSyQxS0R6+xNLuNcsaX7r+GeifhWN9xpztQ8FW5oy0Z5/lK1ZfTsB86hL
	 fM7k5rgdPjYBwpgqhgPYylvGkKYQHLJz7kurCQqxL2hzMeL6cmopmDeWMs/NfIt2UY
	 mGVcFO8XTPiZ1oLLMk8gWRCMqjNwbndcReuCDFYaIBqQS1eRKYELNBwKmN8uDuc3EK
	 AvXmmMhYmj9oM70dTPBNmwGGLyZdT6Eh/OOy0na9jhNmmHQ60qaZEW5jVduMDHjVwM
	 /JZd+HtoYRUwhKghSYSMPnUlMEYgZHF38oiU+QWWv9QP0QNcnS9ZQtN9lZvFhzSP3R
	 dyaYKXyzHL0uQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso10946208a12.1
        for <loongarch@lists.linux.dev>; Wed, 20 May 2026 00:58:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ppwIZ5HJRB3YE4MPWgi4FX1puLYBNfFN0mp+sDcxWoc0vRE2jDT13fCOOBfnRWfurXF6pp2faqW4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Q3Mz/om9CDu+8gCek1HPnkhyoFMneZf1Gqj5dmrW3xozaxEi
	r2DGAJO4QiH/FF4Sr/ernRa2AkqtjlsHBn7M5sP89l97j9hJHRHO8++Ag2rh4RX94pIlBE5YAOx
	lh1pE3Rn4A335nHRmn52bGHZTV0Mc4vY=
X-Received: by 2002:a17:907:9627:b0:bd3:7514:14f3 with SMTP id
 a640c23a62f3a-bd4f333f84bmr1393090666b.11.1779263892883; Wed, 20 May 2026
 00:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512082029.2131-1-yangtiezhu@loongson.cn> <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
 <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
In-Reply-To: <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 20 May 2026 15:58:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
X-Gm-Features: AVHnY4JUF3fnjFZQOWow2f8bu4ZbydD6aQEm0RaHL2wi4OxF8RdM3OYESyBO1Cw
Message-ID: <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Fri, May 15, 2026 at 12:29=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> On Fri, May 15, 2026 at 10:52=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson=
.cn> wrote:
> >
> > On 2026/5/12 =E4=B8=8B=E5=8D=884:20, Tiezhu Yang wrote:
> > > This series addresses ftrace and kprobes issues observed under heavy
> > > tracing loads.
> > >
> > > Tiezhu Yang (4):
> > >    LoongArch: ftrace: Fix stale per-CPU kprobe state after task migra=
tion
> > >    LoongArch: kprobes: Use larch_insn_text_copy() to patch instructio=
ns
> > >    LoongArch: kprobes: Fix single-stepping instruction slot preparati=
on
> > >    LoongArch: kprobes: Fix handling of fatal unrecoverable recursions
> >
> > Hi Lisa and Rui,
> >
> > You are right, please ignore the patch #3.
> I think Patch#3 is OK, but you need to remove the introduction about atom=
icity.
Will you resend V2? Or just ignore Patch#3?

Huacai
>
> Huacai
>
> >
> > Hi Huacai,
> >
> > Please disregard the patch #1 and focus on the patch #2 and #4.
> >
> > After thinking it through, it is better to avoid calling functions that
> > might sleep in the probe handler. We have modified the test module with
> > a proper way, there is no problem thereafter.
> >
> > The right way is to prevent the problem at the root instead of trying t=
o
> > fix it after the fact.
> >
> > Thanks,
> > Tiezhu
> >
> >
