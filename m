Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1923313E
	for <loongarch@lists.linux.dev>; Sat,  1 Nov 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762012454; cv=none; b=c/Vv8c3Yrzwd5er2Y6qjF1E+lRTZoLB0qSIW6vuMKbLN7ElJknh0n+PEI5NOA/L28kVjZ1vT6e9Wp2CTrjN6/5hpqzEjbmGQtXJr3m4jy4Wwc//y+pkk/7ykkQlJglLgmjqLi9omC0uqQcEnbu9R0/kyEkRCg+8E9eg3mY2W9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762012454; c=relaxed/simple;
	bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1d4B1lKackRaQswtZ8deGOANpLn/uuduVzww+081yvfzkeO/PkWxwJXpYzogLwKchKBjBCeAQyvMG78p7ASVpbg7Ho5/1MMuNogNqec/HvMhUpK5rHdNfWriUnFLpidNiP/3zKFfm4zcmKetbA4hwraghL+D3bFMa2VxypwO0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSkmc2c+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSkmc2c+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33e3018f113so563493a91.0
        for <loongarch@lists.linux.dev>; Sat, 01 Nov 2025 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762012452; x=1762617252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
        b=YSkmc2c+sEB1LAiChHeLpiYdCIHnGTAmpu9FKxTTx/yzy7HTENyIKHCV4yYGSBK8F8
         et8gv3fu1jwkFeYk41dfTCGt7TzMB1pzMrWe90XrBiRu1QLYCysaFy6A4ZI4h2hgT+GX
         WEq7VmDMMSHnuoldi8XR7l5FEgIfWmz5OvT8uvrjRtB0ShAQYNTF9IJOWTHKNcA6GpfD
         Vcv5r6MJCDOr+ruKXUU21s4Y0AZOovUGWtbH6JmAIE4NFq/A1SjHwidgbD+0201xItg2
         Aaz8vxt38JgYNZUbhMLTbBv6dD9I7Km3ZLEqm7OzRrABeTOxDcBX4ADm/yzZU4BihWyo
         iSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762012452; x=1762617252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
        b=udpM/qmXDSAuVWOwMnQJQT45Jv//GyMHzzINJfD5FqmJ0Pu0iWl/uiNrZcyHgrwkLM
         WfyJzjap+chEto2uRvhVih3mKUTbJ9FMyQzU/LSVR/317CPIx7F4K+mMFQGSIXzjpZdn
         MnGD97/O8T6KhdodiB1oSfpblfteZ/ggkaH5T/eCX81kEptapqVL27IYDSdtN61Z7DHw
         /9JdHHhD0Pv3wgR8Hxc6kumIMbWo5HSVyDlSeedTNKd4PIQ+fFRPsOdYwYRKvTymr0U4
         0otnIbYhabSdjksG7QuY0esAjvnYaVsYTdFPhqYvJKt1VF+223GPF8XZz9Bd1t8UPunv
         k26w==
X-Forwarded-Encrypted: i=1; AJvYcCUVf281HYuJi4DJBlYOAb5TBhvXUhQbwir2N8JLGBpNikCNy1Lul5pm/SNC9ehFpe7Gncf8qm6wu+U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxExI6+La7P44DVfVXozPmZ3eerUO8aAB6upUiUO2jrif9fZc8l
	StYJVBFYXwkc943pMUPpBuQHvW8JbY86k9ITg10KiquB2abGNXQm1F7nMjnsyW3db5dy9TRxu2F
	Nxicahy8Wtc06oTVx1dxYg8oaDbh5nTo=
X-Gm-Gg: ASbGnct9Q3UOWsuR1S1UJQfoy/twXiNO1hxvbGBN6rS+ShG3bHOCQFJNlIrwh6+vpPH
	Q6j38etNPXqY31TIGgfHjnPcZ6S5VTRCvXJ+H+h0UG18RLq/HahOcstLHpt5eocAYhZg3guJsOZ
	xHfovUXons9Y8Vf9r+zSFk3dRVCWhLLi9FgFzXtBUrSwyq0Hx7Cwtgf1NPNcvjHOeGgu2HuwAwx
	3ne95DDksPbxRfyyhT9y0OKwyHIWAl9pwY/OOZ5Enk9AKaShhLkZbO44N8YuUJP/m7BvxSnR7Kv
	vOY20MZN4i/c1sq+oKQt/cHdKKYQwG5STslncdncjUDoCvx6/zerCg/1lvp7bEwmw6UVH0HTKhG
	VUo0=
X-Google-Smtp-Source: AGHT+IH98SKG2dNVCAgDMWAsxf7IghHixGwIwUQXBJWnv1yD4/76UJbZrqEwBLzCN0HeDuDp9PdZmiEDyhXUpHiXB1s=
X-Received: by 2002:a17:902:d505:b0:295:3f35:a31b with SMTP id
 d9443c01a7336-2953f35a4edmr28620535ad.0.1762012452072; Sat, 01 Nov 2025
 08:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org> <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
In-Reply-To: <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:53:59 +0100
X-Gm-Features: AWmQ_bmfFv9e45aUeUVbkE-t_FDmtneqkzR5nipR7SAGPuD1TLzugXVWW0zvQak
Message-ID: <CANiq72nBEkTq7vos1Lv5Z1bgdZHt+UQWbauC0nr8xwxhuVBJJg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 12:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Does this need a CC stable too?

Definitely -- I just forgot my usual line:

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Thanks!

I will apply this when upstream's PR gets merged and send it together
with a couple other fixes.

Cheers,
Miguel
