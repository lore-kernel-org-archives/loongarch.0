Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3C1AF0C1
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088606; cv=none; b=pExVrXvTZJEsLXUb7GQxJwy0d6lETT5T625UYg+cYbT49nNrJGmM+fzzi84Yzf5qQg4nN5qtgAb8xzgLB6mNR3KcOAn9hXDnprMN5rUhUFhyhnHqUChj814qC/07wDlr2GFjj0zkwvS4vDDwHdIV4dG9owGSPQVwDfDiaKcii3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088606; c=relaxed/simple;
	bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpNjxkDCSmrtUxL6JAPXWd9RUQokecX98ZkVTQTSQ9O7Lq4ozTnOCP0X0Ng1MAaWrIdkqIkaeOit02H4B52KhnzAeRx5Pft/Naaf//WgoCP+TB6KFWlbxty0prpZpnZtpzdWZLgzqXvpEnjN9sh7Akl8lGb3eX2xytrmJgwqZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWKrLpj1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWKrLpj1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-312efc384fcso61123a91.3
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 18:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088604; x=1749693404; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
        b=jWKrLpj140UC1Px3q0oRQUXwZeQrhvkpJaUIT8vMzSmJ37Wa1YCw1mouWehafTSRn2
         FgqdONDn5/G/VAZTS+U1MIYzwT3XLL4z55+cZO1AmrW3gRXjo8ckHsdSeL9wG8iPoHkT
         c6OAHN8sGxYINWH9OimtwIqqm3uYpSmq4ddwVKCnR232RmLmxUc6oJs89bTorfOC/TLK
         C6UlK4zPGJb1tVS1lJBs+AkfOCFvP9jt7q8tDO1Kfi3fE+Ot+Ta0XY6MIk35IYpIk2i0
         mlUadIMYb4qZi0Xw/JaxO89yPLv+Gw7t/78KSPfRKUWg+B2Bo+ovrBTsP+nubchtfRPt
         wZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088604; x=1749693404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
        b=sMmDnflTiZOQkVq+PE9RapTA1KDLPkWG9HZD99KAI96HaK65LStj5g32MglZ3U9FT3
         IqnS5qyLQfyHo2GOHDM54vsPy8AKlLUitFSVhyR5bH6T5IMirpCKMjBCbqtT/JJWEdPg
         9QYdbC/kLVQcL7vK+osxF2y1+NZpaQUCC9EUIFiULvqGxyTXB6JD6fESSBgRwCRz4/5b
         iiH8pjRvRfSsNMsoe7zwWIl69np1/5WHCuOReGk5/FJ668OZFyKTIPprtK9u7F2vNCjT
         EsS/1MY8UQ2GnUTzaVSdb+cYDkmO5ux+KSPHzC2vjyrru0xSDc3zR0eIBfOR5fW7YHVE
         0xOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEtbJcttQrIgiZS6egEgjx0+trCxxT+X6QgNYxqmHaM285LEZbbB1zBlrV+t6J1sINIpGe2S15tls=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwv7a6ANpvm6avNg0EWQT8O8PGsM0tLX+HglmsQ9wUnEcLef1z
	+phOZmhAXtqiX5caTaDqtBd91Loim1E/lVNzdJRNm65djLuOAfFYYZlPu27LSiq8VwK9+qwqqlJ
	9OQTt17TPxiRrMFiztnEyKDEIu4HOSdM=
X-Gm-Gg: ASbGncvMbxrqLXVdzpvZqx7Aep3GrWHVRfPGL4jUTZV6lqhSrfQr5/FTH1utmM4QvWz
	B7NFNh0DpREdjV6flJjtWAKGp2UjQVjRUqPzGCalODqIdzqeTyqBA3ZDFAvp2h6wcVzufb44Fe8
	ewgkRbPbM5KErGDpWNvKZS75Yc+eMlKFqO
X-Google-Smtp-Source: AGHT+IFHh37ON8OdKdzVBBFcxedCAlOOwXK4V/iC1EPOOjVJZxdYBvuNOsHpf8VVt21G19e5ASyjwRRmZcF7LJTAmMs=
X-Received: by 2002:a17:90b:48c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-3130cabf1f7mr2575310a91.0.1749088604483; Wed, 04 Jun 2025
 18:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 03:56:31 +0200
X-Gm-Features: AX0GCFugcCm505NwwgN-68q9ZVnBp5bIOw8-paPBHPB9oCMtC5Zudgwp1svRBNU
Message-ID: <CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:46=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This patchset adds warn_on macro with the bug/warn abstraction that
> utilizes the kernel's BUG/WARN feature via assembly.

This passed my usual tests -- I will take a better look and pick it
early next cycle.

Cheers,
Miguel
