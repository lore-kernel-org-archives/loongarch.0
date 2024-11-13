Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D387083F
	for <loongarch@lists.linux.dev>; Wed, 13 Nov 2024 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731517579; cv=none; b=hu49jwwpYeA5/DgVVWI261U8q5XGCRUc8+UOboBf2cxjg2jj0IQYDD2Pt5KgmdjblLDZ7v/ugK/VQo4aWNbIzUCE/MlnGNP3nwYZDFDwGO3VjP4FAdOZ+IWT4bv9wjwF64rxi8x+DoxDlmewF74vf54wj968X2JvKywk2YFKRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731517579; c=relaxed/simple;
	bh=U9mSmdvebpc7SIfdO7D2vMyeVPrF3HfFMdaTvCTXFnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btaE740edLZUlKwuhK+PeYU/xGmZMFgex2lkjoSlFE9CU7o9AEoHWy9wMPtvqLcgvQPI5msuSBUnH+DvH+kK42NoW9+JfUH93c74d/WrrBtyWQCM6Io3cK+TGK4cA9swK/KFXb383AAyx8hjw9WTGhMCCIpl4wxIkD1z6jbDZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UG9q8InV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UG9q8InV"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ecaa45af7bso20819137b3.3
        for <loongarch@lists.linux.dev>; Wed, 13 Nov 2024 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1731517577; x=1732122377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7HNwvxjs7/kFqm+0Upt4VZLTejUABVboco4/4FyZBQ=;
        b=UG9q8InVq870BnDIN43zITLjcNjizRKFMhQ680s6+1nVuqYQeca6k3QxXIL2DKDdIL
         aMfAGfRDyvRsMlHLUFvjWVcH9RxYc0WwiSiM6781mP+k0x7/tK7ciPTcCKIvQN1TsNB+
         GQ6fMkywHX0NpbMPdi1RFeO8aKY6WSi9BDeTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731517577; x=1732122377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7HNwvxjs7/kFqm+0Upt4VZLTejUABVboco4/4FyZBQ=;
        b=PJFby8gLFv8S1FOmYpE+7DkH/ZQaZ4fyw/z6KwOHdz3Wo4ERhTuu1sGclluGOHIh3/
         DZCJ4/aRPy6iDyyn4sCaHVTyIEL4YgRMf7FG/V8ithM559NrPkJ2Qll7wbxosjJ85wew
         irAtUfjFFx/kdgvScB3ccopUW9vJO5M5sMK4o9fnqbiwFDrfSsTz8qZuqVjSTh5og2Vt
         OGs6ZMwBQH1ViCN1I7dl+y5O5AVjrBIBDlu0T/FF4Fh/weeFVa7ku8qGSssK+cx3ic4v
         bHQttjyJIYZ5L510m9Ze5CAqx6ap7KRHWQxohLjdISKZUQ/8h/UtR2btrbcMem9nWHBC
         C3dA==
X-Forwarded-Encrypted: i=1; AJvYcCXPlbl+A8Pcwerq6kuJoXdH068IaHobDjATrNdtfmXseITO+ONgeMs3vqsC4xyjkdtEplvr/PsuR8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcY3786HMlB7DXTMuw+hPwrHUVLSJvszz9ifcmdmwfEOLXV7cR
	P3Dt39vfA7u9mPYLhvfeftbpzy7O4ruopuZQ+dlpnXdCcHBX7rp2ZpLN4S0zWPsosGOgn2xduh7
	yyTZefXeq8GiEk5FoJO8NeIPrn6iErvoANpwzBg==
X-Google-Smtp-Source: AGHT+IG3duG8a1UDQht/mWeuhARKmr++5c3TJaN8LKjjGCuT1HlbkFbDsA3tyK+oqirwuGtWZGK1XLeNQvJ3rvg3ziw=
X-Received: by 2002:a05:690c:6d0a:b0:6ea:8bd9:6b2f with SMTP id
 00721157ae682-6ecb32af35fmr39075867b3.4.1731517576775; Wed, 13 Nov 2024
 09:06:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113124857.1959435-1-chenhuacai@loongson.cn>
In-Reply-To: <20241113124857.1959435-1-chenhuacai@loongson.cn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Nov 2024 09:06:06 -0800
Message-ID: <CAADWXX9-LY7aaMax6KdtDV+vOkm_WKE76Qmy4n3UHN61O=-2Lg@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch fixes for v6.12-final
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 4:49=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> LoongArch fixes for v6.12-final

Hmm. This email was in my spam folder. I'm not seeing anything
horribly wrong with it, but I do note that loongson.cn does not seem
to enable DKIM, and that does tend to make gmail (understandably) more
nervous. Yes, you do have proper SPF, but in this day and age SPF+DKIM
(and a proper DMARC policy to enable strict enforcement) really is a
good idea.

Maybe you can talk to your MIS people about setting up DKIM and DMARC too?

Yes, it's a bother. But spam is a scourge.

                      Linus
