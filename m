Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E131BA86C
	for <loongarch@lists.linux.dev>; Tue, 26 Nov 2024 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612735; cv=none; b=pPo0lSDu5Z+a2rGrx9mRE5RKlnK56qk2NoJgSavbby+7kH72J5NQm1eSR94tQsaUAiVhBdUmIzJgCxzSYawFzmMzk9wIzKhcv8d3CHSYFHE97MxQeyQABZLH9rR+xUeIRddvGMHwX3dmRa20KwzrNb5WFQ6tew8n2n6AJfW6yoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612735; c=relaxed/simple;
	bh=nkFrveGHjAdm7Zheszf0c6YvWzZ01i1Na0eEUWfYMlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHir5cFlmWQddqGDdzz2LGNiVqXkwuYI76Ex74bAEsK5bFgoR6oiTSyPO3z5JzSZ8qmKci8Yw/pi0bVB6eU+oCazR7CTa/B5x9umERPOz2LNGtWW5VM4JkJCNwHPkWmSYgTqiWTtcNFWNV9jhpKCmABnQ2Q5bmt87MgFVgUSmm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Czb+fui7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Czb+fui7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE25C4CECF
	for <loongarch@lists.linux.dev>; Tue, 26 Nov 2024 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732612734;
	bh=nkFrveGHjAdm7Zheszf0c6YvWzZ01i1Na0eEUWfYMlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Czb+fui7xAdTkp/RO1SNy4f/P7FS1l2Oz5AitucvJ9uCyatAKHoAJzr0n1xKwCMba
	 TdVNVYa1SO0n7JpNt1IgZB1r9N/9ospPwcRt2J0Kevp+ypjnNAY9+HV2vAiffMFDre
	 OBRmv674+d+YaMnfhX8tAmb3w0NkL6E0M94s8h5J45jxJ6DvT/TBXWZO5qqiQCwCI0
	 DCEYJfv61m4QEQx6NSNZHzkfXKs4T6fT9BvpZLKCSozZi61NfvwSj+4OgNiHmGAj1G
	 F5kNgMSSqbURVPgV+h/G6MZP8qK4nXuIhQuK6k9UOKkp9nRLuHsmWBykfmvyYUuqEW
	 DPQMrdac/PxzQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so571142066b.3
        for <loongarch@lists.linux.dev>; Tue, 26 Nov 2024 01:18:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQreTg9HNuV2CWAsnnQRCo4tdu6u25+PH9taRX7QWHcZ9g7EXAJgIyFmp48MRwP/5gyClLmFir9LU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVEg2Z94FovSC4ibC0fQC/U7gWW90RSiu+qOYOlZ1u8ZzkaEBj
	CsBX9wiCG8w12Xt//k2b9lnvDJFIUZlZOquQezQOu9EL2b2+U2D82S+GRAHKPFTckrnBEDvb7HD
	xNsFtkmG5Kd4Z7Y9F6BCbkF9P6UQ=
X-Google-Smtp-Source: AGHT+IGlFZeO8LFVIO6z3o2ioziX83pkTu+Zzoccwgrvt/Y0+T/DuXypMPfe7ysPBiuo0OCU504nRfaS/blo6DrTDmE=
X-Received: by 2002:a17:906:3111:b0:aa5:2f8a:b94f with SMTP id
 a640c23a62f3a-aa52f8ac9c8mr933527766b.54.1732612733263; Tue, 26 Nov 2024
 01:18:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <CAAhV-H6B_-y6ebR=GJmazzukW8Ad-=VRJPvT=ZF+41+rTX7D1w@mail.gmail.com> <20241126072909.nyvqagvmtnivh36w@jpoimboe>
In-Reply-To: <20241126072909.nyvqagvmtnivh36w@jpoimboe>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Nov 2024 17:18:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5=y=vjOQout7Ct87uAL8FaJzUnSHrkRuosWXH_7CwqLw@mail.gmail.com>
Message-ID: <CAAhV-H5=y=vjOQout7Ct87uAL8FaJzUnSHrkRuosWXH_7CwqLw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add jump table support for objtool on LoongArch
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Peter Zijlstra <peterz@infradead.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Josh,

On Tue, Nov 26, 2024 at 3:29=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Sun, Nov 24, 2024 at 01:33:43PM +0800, Huacai Chen wrote:
> > Series applied, thanks.
> >
> > Huacai
>
> Please don't merge any objtool code without maintainer acks.
I'm sorry for that, I'll drop it first, and then wait for Tiezhu's new vers=
ion.


Huacai
>
> --
> Josh
