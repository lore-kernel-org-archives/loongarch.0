Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3545548F5
	for <loongarch@lists.linux.dev>; Tue,  5 Mar 2024 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709633427; cv=none; b=Mb/NgVDk3BLEMgbtAwRd3uLKT6d+MY52gh1EXrz5brgPezxRj5ZpKbw5s02YB4lLv3Ct4LBPADAnEiERpgsteIlRWasrYHng0NmQDXX+oCNB0k2oFHX1kJGyPIRqv8zZBUDF+qoyFcYyFcUVIbXsFC7GyELnvcz1GzMpPxB1goY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709633427; c=relaxed/simple;
	bh=gmAtaa2N2nE82MXltIXk8UaUAv8zL+yzOdz4Dk+oass=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2XBKr5XijLgPg8hNphdnA1oTI6PEGc82k8Ykbg4zTmpqnsZ2rnweeSGj3UXe6qiZ7nQwwo+AH8TfOocbeqwK5PyXVv6K/ptmuJbzryMkSaQAyebf5P79ocMDTXPGliVPr3C1UGQXp93l/0mIhpEtRuWsX+b1OMSC0tF4WZ27pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DshWT01e; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DshWT01e"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-299e0271294so3701582a91.3
        for <loongarch@lists.linux.dev>; Tue, 05 Mar 2024 02:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709633425; x=1710238225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmAtaa2N2nE82MXltIXk8UaUAv8zL+yzOdz4Dk+oass=;
        b=DshWT01ew230VD2WnT3f0/n+UdfiyuDmqtx0l0xcjaWd7MhqSHP6D0wFwgjroLjsW9
         6L++GZHSjGCcswDHXaXFDhFuhYrFPAVKb3Bjphld9SeciwkVjZAcybmrC2UeaLVtP81N
         QiN7OzEnOsTalFP+Ka7aaB3seSoxqqIXAXKXEOcACLad0ZEqo0JBwyZvRISNdGwlynvy
         X9cIfQD1hdBJxEKhjK4Q/uOAELkpdDLJw2V0XEJko6pvebS0Yhi0bgkBvgWDpRIINTKX
         EINH1aPuRXIkJ7L8YJWCjbSU2hYamxFJFtDhcFiAj4r1pchrnvbZPYOpUKMEmuWvnsHZ
         ZsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633425; x=1710238225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmAtaa2N2nE82MXltIXk8UaUAv8zL+yzOdz4Dk+oass=;
        b=D6x+9K4pV1XxOa23zSDj2vVlgy6RfRpHqs+JX+GqaAtOSdZSzCaJw/1901uVhQhwgA
         JjqJk82uJwdmqHBryolPlBEuIPV4gyC5M74xqbbT8zUUeXLEIBqKFZuBdebSM1aVlZJ/
         J0Pfzxse1ZPaPZR7e0E9FUZ52Jok3D19KNcyV+KYpEcjVVALGuQrKlBcUFPijv0tpfTZ
         AI5R9HzyPNOX7dS9W+kwqq7uiV+mCgPP8Cd3hbQlBW/w/+RdNCmJZ9+E4oJfY6IaNwgW
         fQMC9/kq6X8K6AVBOpCDZF8PUPjPxwd50Wq3+V0O7UyyOPrTAXYGHqY+/cwhhoBrx2Xm
         TZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUqefF0U5N1GKY7acYbhW8k7tajv8RE1X9SbF0cOtzS6Cej7Xyeu6NlxYCL9ZgeENo/xwfgrG64m/CAlWzhdZm5Ktmx79N7AMw2
X-Gm-Message-State: AOJu0YwitbYV2C0XjBnODX1Min1r4BZc2BPT6MeG3A38h8mXZL+mvIZx
	U04sO5m3CTP2NroK5ZgPkb/46Viz0Yqjb9Wzx6BVrCtRGS2SileJ9turHIjqo2aJLAi3IPt1jS3
	lSSm/A1zbLRL/YMiefXedt+xmL5Q=
X-Google-Smtp-Source: AGHT+IFvN55XESn+MGAPLMObN5HMTDIRSYbY4oFEzsZN3jCgHw7bjMfXlZewHZ79chco8tXX7+zcKmmxLZaIv3JU4ik=
X-Received: by 2002:a17:90b:192:b0:29a:67fa:7bb7 with SMTP id
 t18-20020a17090b019200b0029a67fa7bb7mr7859867pjs.47.1709633425130; Tue, 05
 Mar 2024 02:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240304141426.163517-1-wangrui@loongson.cn> <CANiq72mvdVrzN19PC8pNrvuBLkOEEQ3yX0WG6JcWc+RVaSM2nA@mail.gmail.com>
 <CAAhV-H666zsMadZuzvcRxxkUxSpkka1tt9AJO_WctHDL8j_HNg@mail.gmail.com>
In-Reply-To: <CAAhV-H666zsMadZuzvcRxxkUxSpkka1tt9AJO_WctHDL8j_HNg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 Mar 2024 11:10:12 +0100
Message-ID: <CANiq72mHCNU2wGpELBbgOA8LKQhm_-RyG8+9bP9miYJOkUw2Uw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: rust: Switch to use built-in rustc target
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, WANG Xuerui <kernel@xen0n.name>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 10:58=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> The base of the loongarch tree doesn't contain the arm64 modifications
> now, so this patch is better to be applied on the rust tree with my
> Acked-by. But if you have some trouble doing that, I can also manually
> merge the arm64 parts to the loongarch tree, and then apply this
> patch. Thanks.

The rust tree doesn't have the arm64 changes either (i.e. they are in
the arm64 tree), so we would have the same issue.

Since it is quite late and there is no rush for this, I would suggest
applying it after the merge window in loongarch64 and thus avoiding a
merge. But, of course, up to you!

Thanks!

Cheers,
Miguel
