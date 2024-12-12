Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62165204F97
	for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007229; cv=none; b=TzZTH8TtZI8Qhm/ZcE7xsGfrAvBMUBnHCBHeNPSFbaiQzEI125f6FMgJTjlCnmzKunEHycPzijHUeASuG9V+69sEmlnHkMugQjQiEtrWm5W4iybpFTmthYyJyrZ0B+uWO8ni8j7Rb8bhX8+KoZVTGT5l9hZgFmDgiiR8pm4YIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007229; c=relaxed/simple;
	bh=r1wFQ2XEw4h3NqlPy/Ig8PdgIYeLmggghPp5vpM+aTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0mWXAyj04UJmFKYU1cqniv9DkduVFerDP6bSF49X77KTod+eZ/HkaudnAr7tIiTH3qDUC3v5N/dTVe1l/G6wEGomTvfZjDzSoD14wiWlM0rZGszuBWGjb2EO5XOpXrhsXbhoEG8V06RaJZonLm6ycyoZ1LMzMSeqw+nkNFIwWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0uAoQRR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0uAoQRR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so76881a91.1
        for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734007227; x=1734612027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1wFQ2XEw4h3NqlPy/Ig8PdgIYeLmggghPp5vpM+aTg=;
        b=T0uAoQRR6lbMDWtym2sgLVs2ZKSUj8OgqkSnBlYpgLAuakmB9RtSpeUIm0T2Gcy4UF
         HN60JwiimSFusxV/TLkfiCvKVxQrCVPRm2fYeXFdUCdgXyJ7SBcNipm7RmXTcsONQXfJ
         K+Yy8jIRg+vlb2C4w1SoLJJR8C/C8O+B/4chsS/Uyp9qfBOGvHJnFXsKVKuDdhBCGuoN
         jyVcMWFKMINb1Q5P+DQboeyubWbgiNYwY3nAEdUQu4I9+hUtvZgADFv+HYkskNOjxn1S
         3Tf/AIJ0XT024S7K83VDxoqRoSU9mlca0zzrSkZLeepUWEn3paO6MQ8WOpiT/C+0p+ok
         iv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007227; x=1734612027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1wFQ2XEw4h3NqlPy/Ig8PdgIYeLmggghPp5vpM+aTg=;
        b=cEoklcqoR6ZYEn5kU4yUvkjyxAROkq0EiyKq+VXmA21xXVIXR+/gQ63twOiYCN81p5
         Q67WLt9vS445dwAqZcQdtnOmwl1oYtH1sXDebrklR1OGfRgMVxDnTOrOPcBAhfKV0M5n
         F8xoNeNd8dcrdQJLu5MjZmwdZM9agBOLWnd9tXajwya7gkTA6a633PZ6hpGNKZyqG6Si
         FDBnxo+yF0kjKaLHHXUx4SnTbpo3/jvijbYipzWBvfZa7NAczP2Ge5t2F3/rX/rJcjlJ
         p8duG0mtvOJ70CewpF1V4jejELgDq/4sR1ul+g7okB8eHDosZMgKBOOZCwZWysNkxl5b
         9fqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnXnvdrrwvKhXnXDgQp4HZgtNUCe8d90GzLLpCGj8bP8J9CMFaa0GufUI/KyoLbZMMqxUSPu3gq0k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUSRm/7oP95yU7MU2CXHYAjdF+7XMagLgexHet+DgfUwHI3XE/
	ev4C0bVWmFNflBxO2nf3wnmzy3UYBh0932K9tqyWfdFuQ/z8uoKxUNamW2KeG2fvUC7GXq5s++H
	cUCGh9dtizV/C1M8SLQ20oCYf6no=
X-Gm-Gg: ASbGnctThlc+P9xt3RwgkY/q2eCMVUCdAsDLR8LrEkGpXaAg28QIEjj1iv8nkDwv8ud
	XPRpQfEaWuO53QaR8k8LN+8LnBhJPPEWQP2aTYw==
X-Google-Smtp-Source: AGHT+IGFpqHYpP+ryhHdXHcJSw/i/CLG0LKsPNa9VsJsTDjRyGichTiBKLOQwEEn9jpAx0lNH3xQvXBViE9Iz/QqtPc=
X-Received: by 2002:a17:90b:3b87:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f127e2416fmr3955460a91.0.1734007227479; Thu, 12 Dec 2024
 04:40:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com> <173395634899.1729195.7492083712432982213.git-patchwork-notify@kernel.org>
In-Reply-To: <173395634899.1729195.7492083712432982213.git-patchwork-notify@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Dec 2024 13:40:13 +0100
Message-ID: <CANiq72mmO5SswxmdcLc0i_rY+ZVo4zY8AsmHPPBKb_Vmzk8+aw@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Tracepoints and static branch in Rust
To: patchwork-bot+linux-riscv@kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>, linux-riscv@lists.infradead.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux-arch@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	ubizjak@gmail.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, mark.rutland@arm.com, ryan.roberts@arm.com, 
	tabba@google.com, linux-arm-kernel@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, ajones@ventanamicro.com, alexghiti@rivosinc.com, 
	conor.dooley@microchip.com, samuel.holland@sifive.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, maobibo@loongson.cn, yangtiezhu@loongson.cn, 
	akpm@linux-foundation.org, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	cmllamas@google.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:32=E2=80=AFPM <patchwork-bot+linux-riscv@kernel.=
org> wrote:
>
> This series was applied to riscv/linux.git (fixes)
> by Steven Rostedt (Google) <rostedt@goodmis.org>:

Hmm... This is already in mainline, and I don't see it in
riscv/linux.git (fixes) -- I guess it was a mistake?

Cheers,
Miguel
