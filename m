Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2071CCEF0
	for <loongarch@lists.linux.dev>; Fri, 28 Mar 2025 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178519; cv=none; b=I2OUOxoHcCscrE/bQLQoUXWk/LcUqCPcXyA7lTpeBRpKDb4TcyPWiOgm0rUm5+1RR9n2Xxs1EuEyKS/14Dh93IbUCAAr4haV+MNlO9qCNq8XplqoQnNTE2NFMLQ9P/ns+HUSOBd2AeSVoXBDr8PDBKgrBadIHRB3HBRWNbbwMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178519; c=relaxed/simple;
	bh=CmGR1W9b2oM3HkNEBI2AYOFZPDQEfP3x8ljARqgGovs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXMJq8aRxRyJqsK73b0nrI6uUNIVoryvYvh2o9YuQn9a8kxAJuFlYoHEa+BK12szV5y5hDtiyK2s98ikKCadth5oFIdCPh0C5rhS2V2+M31mJRH26BDZmPI2+EO5+0RXneR4npvCnmbUq5h1r75JpNm7Zldi2m7KTLODBum7uMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPcETwsm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPcETwsm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301317939a0so494598a91.2
        for <loongarch@lists.linux.dev>; Fri, 28 Mar 2025 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743178517; x=1743783317; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0awkyL5t3rsWIxtC+GV3omh0jTpCEAWKwJhyhjRWrVg=;
        b=NPcETwsmdOFAxLCwrL5OjQxnFj30rqfyw8biyPdGbgKLNW+Nh45apVDDhNTVU77mje
         mETGZgwXUDzyoWlXmE8yyUS+UTr+Ql3VxXikQ10EWneF2vrWJvDqO+Gcsea/mOAxmdZE
         ZePJxlnSeD0OL/5lYTtK+zT+HbUGPupT5XHzRUPrQBTgbigmtHL045XmztjNuo/GdYQo
         W2MZj2uzoPsarB4PC8W3XM26/X5hp/f7SKhPSdG8YZj+K69DGrMDqvtu+G8bYO19hi+4
         FWu7ep1lYT3zskLhJxWUnj17XMTDJbEnFnxzxEG0bD+1RMfPW+Chl3L0dWC1oSQkHDY6
         2Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743178517; x=1743783317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0awkyL5t3rsWIxtC+GV3omh0jTpCEAWKwJhyhjRWrVg=;
        b=FH4wZF0yCq1E5Gnn3XLPOkL3fAEir+Hh66Ky5GNMJbMEJXZt/bTTk+0Af3+RVxWY4K
         WYgi3OsI4knB2yHHIwRROKSmdE2L/crPiXJwtIn6jmvZpc3Fepa8nzApcPudH9LbQdgG
         yrTdHFgXRK36QIL3OtZERHpZWGVzJKi58ANLZkBAfA1e74qnize9cbMsWMeICmd3I0nb
         T/i2rVsR6VpQDQsVh8pvNcjshW/ywXoL6XCOVShJThOdwKSpHjxDzpjD+GLbnuTOJQE6
         IPmw8akp3zICNlmN6BqwKP1HqbDlOpIMe2DDbu9cVQWCP7F/KHYgBH1vnYU1U2HNCYLn
         1Znw==
X-Forwarded-Encrypted: i=1; AJvYcCUgd4gvPtPrm20nsW14a5ZuPzG4F43oE2vz9Oyiogm6/kNEmiidKAIG+rwsBwkCs42JEAsizg7mYSk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYEGGxmrITfIX+dAjPyC3SwMeWFYldHnc6mNFBbDOzD67/poYO
	olD/oCSSRSCt0MaX8wdO2A+j9+uMXbz14hCp+2VzTHY61jUaZOayxhTsEWRbkvSUYbe0cM2yS8S
	0Pns25S8d6ocS8oe5oK4J76zSxQ4=
X-Gm-Gg: ASbGncvt9utUFZVSZqC4MROgtTdgbfLmpLVlJUD/+2f4H/tyWte2j4p0P0UuHZOCIbt
	ENaQ8d/OdE/VbzAxuqfihQomiXcystEcGkNlHWXGJuqiGqgtsHtm9T8TCYVSHZv2ppMtDxIPFNT
	DiGBrVTlstWQ9QL7kMV6Law79nQPLKUM4K9Lx8
X-Google-Smtp-Source: AGHT+IHpn0XubsSScUGD+yuythr0b0lI1lM1TZwBkmj8zcuCFyTDK4gsc2cQ9eJf+cEDv1Ie3kf5rbPpmLeZ1kOkj8E=
X-Received: by 2002:a17:90b:1a8f:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-303b26fe5fcmr3944480a91.4.1743178516457; Fri, 28 Mar 2025
 09:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304073554.20869-1-wangrui@loongson.cn> <aab657d72a3ee578e5c7a09c6c044e0d5c5add9a.camel@xry111.site>
 <CAAhV-H5ayw7NxbSbCeAFaxOz+TZ8QeghmhW6-j2B1vTcjYxsJQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5ayw7NxbSbCeAFaxOz+TZ8QeghmhW6-j2B1vTcjYxsJQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Mar 2025 17:15:04 +0100
X-Gm-Features: AQ5f1Jp78m5RCykhet4JNZuQWUIdRgx13WqG26TPp7YpFZ0W88cx3LDq6ng2qvk
Message-ID: <CANiq72=AZ+CN4SScZcnRBpkS8ogCaZ=Uhe=k7fhGCVyecyRu5g@mail.gmail.com>
Subject: Re: [PATCH] rust: Fix enabling Rust and building with GCC for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Rui <wangrui@loongson.cn>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 10:12=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Don't rely on  default behavior, things may change in future.
> Acked-by: Huacai Chen <chenhuacai@loongson.cn>

I was pinged about this one -- are you picking this one through your tree?

I didn't test it, but the change seems safe to me for other
architectures that we have at the moment, since they don't seem to set
any of those three from a quick look, so:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

In any case, the usual question for these "skipped flags" is whether
they could affect the output of `bindgen`, i.e. could they modify
layouts somehow?

Also, it would be nice to mention a bit more what was the build error
and the GCC version in the commit message.

Finally, regarding the Cc: stable, I guess that means 6.12+ since it
is the first LTS with loongarch64, right?

Thanks!

Cheers,
Miguel
