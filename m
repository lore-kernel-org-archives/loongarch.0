Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895325A2DA
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757448894; cv=none; b=Rqx8x0VanCjvx2KYdGKyj6AIgneEgiuOU0VU6eENv/UNQmibUHVNhHlVIz6NO+6Z73HggeZETCFH8fG9YcZpIU8dzREiX0Fva0USh7CAuikHk/wECA5FhTDZPtaVWTq3sihPpaNG+V8Q1XUNidhV4SW8/UggPlQDkTFW6qbQEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757448894; c=relaxed/simple;
	bh=0RsLYpIdBCFq2CXnIllIIUx06sgVvgCrX54kp3Ry6Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya+2wdHdsg7khScqjX1BClx5n0o8iIms8pPhSrRCscu29En0/I4h+1T5mQPHAuXoGkvEMGaSA7WAKztl7r5qQ41/fEWfzSwKfB7jY4jQUp+XqMA/9lAH8ueCbrffkq8KEoxUCR1JViCZoPNWYrMkza7NAWalhqRgTJf55IPlGhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqZAEHbi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqZAEHbi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24602f6d8b6so12198715ad.1
        for <loongarch@lists.linux.dev>; Tue, 09 Sep 2025 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757448892; x=1758053692; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RsLYpIdBCFq2CXnIllIIUx06sgVvgCrX54kp3Ry6Rk=;
        b=bqZAEHbiQn2RJFOdPggDF9oR126H7zmG5rYjKwIowWsnuY3YefkFA1IdQUEQ/ttZs3
         jntB8fqfiA0o1dNeLoOjPtjV4i5Y+2hcIyA3Elcn8O4Loz4K0OOzpitfbP7JrFWYgQEU
         IzwDO6jrTdK56JgTXf/hZaBRS/ojmlguTGfwlRE6TzQveVhoO2yOxDUIjTWVRpQVQVT4
         EMUZ5yqWcLQAu0XjNVu2Xwp9Ld/ARix2a8xVdH2CUa4M04DKzFBXqkRKwuBN8j2gCxKT
         tZzrE1Ijf6o1jeGWzI7jxQARlpWLg7kqFa9OP4H6fIKVZKh6NBFkk6lnrVuldH7oTkJ4
         W4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757448892; x=1758053692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RsLYpIdBCFq2CXnIllIIUx06sgVvgCrX54kp3Ry6Rk=;
        b=L45Pt9A47h9xL7beXtlRCKs8WaEXUQyxmwEz33ubS5gKbSsjKfAno2gdg6hcaeSxan
         GDsQXvEQShy3Lcq7hxPNU98jIyy4Wf82MlPNkV19IeFrBqd87cjAyH7FZGHATfXQD/SV
         oRG8e5u0Uc/LrK1GpOURe6CeGYqodSjFzA1pJz/2uOq5NBFRPmkKOiWucuSZ1vsAyP0/
         jR0z6XPEbtVTpRsrbjz11RMQ1gzYTICpJZ7qF8nESDvMilIB2Wa7Vu4o3JXYpGT3PGrA
         D/02tECM7yWosbW8yITMj9hPaim+p6YhBiJ8iMJKKTwsPxtSiHsES5kpoZ2zgm8Ndlfe
         HSdg==
X-Forwarded-Encrypted: i=1; AJvYcCUk9lSQmsd2qR3pTdi/ssNL/GUGb/+rDRZj7z6YG1gULtbLJ3LATbXf9wfibHa8BF98DjYcVrPm+lI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/gXSSUpdBwi3Vujn/XqZfcVQVPN3O0gReoQnpirDuCYT4Uajk
	p6w6vAxqX0XVupXnySUecY5fBCLo+5f/F5Ob9abOr1SzBCAKCQl4b9YMRlo1AkQIxy55VxDfVPu
	O+EdnWn9tMPJJakdedUSzzfru/+dh+/HVnhlTz1k=
X-Gm-Gg: ASbGncsCrIiGE+b0Z4Wg9xVzGJ4KsO4SjjOdQY1LA4VFL5sLcBqh6QOm+Jg8sfZuHpJ
	ACpmoleFoISlE5sevlpkH4hvvujse5VmWUFVLGRhvhB0ltOAvJ0lz/6zFrZUD9UCGwG3giCBtsj
	/lXCdj11kooPsMw3lHQIfji2DT3dS+SPgx3kfhgkt7RFi+EnD6sDeBhdi7yOVXnjM8SY3jB6txU
	ElJeiUslDZDXZOuo99e1nR3vKciJedqQPFBcMgHSgpBh7qY1fmYDfwgw94e5HuOCwPb5gN4XF9p
	PXvCeOf8STAqeABI2z6I1RmK9A==
X-Google-Smtp-Source: AGHT+IG8l2Cl0crbnUXdUU1gkjVHq4CtZSPylbc0kTpXl7tI3C1ru4Lsu/w7cyIRw74CZbstsu1Z6Dk+uaNPN+HTnJo=
X-Received: by 2002:a17:902:ea01:b0:246:ed8f:c63e with SMTP id
 d9443c01a7336-25168e74592mr84188935ad.0.1757448892145; Tue, 09 Sep 2025
 13:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-3-yangtiezhu@loongson.cn>
 <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com> <CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com>
In-Reply-To: <CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 22:14:39 +0200
X-Gm-Features: AS18NWDg4ZT2JJKp5Wn_EDsPG-hMufN-5mAXel2614jBzRLlCVd_Ejc82tjlxds
Message-ID: <CANiq72nkim=Nn__xM118Vut-Bhyo6Na3RK-F6a0pCxN-M7Xgsg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
To: Matthew Maurer <mmaurer@google.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 8:06=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> I think this isn't needed. I added it initially because Kconfig was
> dying when `rustc` was not on the path, but I'm not sure how I managed
> that, since `success,trap` should guard against that (perhaps I was
> doing something wrong in earlier development, fixed it, and didn't
> remove the restriction). I have tested `rustc-option` with an
> intentionally missing `rustc`, and Kconfig doesn't seem to be taken
> down (and it gets a no answer), so the change to the macro means that
> doc warning should be removed.

Yeah, that matches my test then, thanks! (and for the patch)

Cheers,
Miguel
