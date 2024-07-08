Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2484A4E
	for <loongarch@lists.linux.dev>; Mon,  8 Jul 2024 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720461194; cv=none; b=Z2walehPvaFr0uA/wQaUMLr7QC3/5j5cGlhzPU+hAdfrqpN4cXmWCNMZtF/rprOWEpR8jyLe8DrOglAnGkwUt2GAiKPUMuRNOBqU9uCt8pHWGn1PkmOckcfMsnIgKGMu2r3iOeXfxBqLIWo1KXykCUOrYKnIsiMhtLQC8pBW9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720461194; c=relaxed/simple;
	bh=iOLaAKGVBNBu76WR45/Ccdjddni/NIVquIog/WJvECg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoN9BHCvy/PO7nnqKEi3trdLBqxRb+TYoy9cMjvoapiT0p5uW+xLUuPMHCkAB0zJKwbmjvVpQjnMxLOkrESn9cglYr4WB/CPId4Dqi0gIABBGpFd4CjyYrvN8mUux4LHAwWAacDUpmugQLn4q196y6mvQHU9SrrnNDh3W9t+6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NequMmsW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NequMmsW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso4472952e87.0
        for <loongarch@lists.linux.dev>; Mon, 08 Jul 2024 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720461192; x=1721065992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOLaAKGVBNBu76WR45/Ccdjddni/NIVquIog/WJvECg=;
        b=NequMmsW8H4REkSLjBBn8Q/GEu8gwgsU4HVJNkfCiHCuCqi81Iz01VtzvMOJWio0rF
         FtKE9Z2vvk+wQZJrSRDWJVH/haWgb3u1n0CIFVufgx+lNWZRpbW6j6xlGTPpgHq1YjPH
         Mh9OBqcn/LVxjvS/+F4FYXGpJOXJCValTUXu1FiJrdh1XWuWEp7m30/BczN+NYIuFvzL
         Qo02jhVgjW2xc8hF8gWHrZ3axXQudfFBs8XORrQ4v9MnIFywyxWi14Qn3jO25lwOC4Qf
         LNzfBK21EaJ6gpJs6hP7k6d1tPY/ZuVpUni08fEMqtfehxgQH5SfiN5CiynQQVlCQg5/
         moAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720461192; x=1721065992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOLaAKGVBNBu76WR45/Ccdjddni/NIVquIog/WJvECg=;
        b=jofjW5l02DGo2fzHefCiUJbv0kJFhsIpFp4hRi6zp4FXCQYSoHAeIP37t0SxchafsA
         yAhQAWpGAWGxUvU72uw+/DYxdOOXTbwpmp/4iDuNc6KHeuofNlctR+1MbAMzi5txrkIe
         r3bY2dEVYMnL4TT8I/ir/9pQu2dqMJtmctHWZ2YeI2oDCxCGVJOv1iSt+7GxuNbtfqON
         bIJWlpwjYbu8hJkd0LJn1TdQBq0r/rYLU+47yFVqjzEZYnzarUpGD509/ftyuoVtE0Zb
         oPl9Ixz/ZQm47gmDej1lyKw4rpcX0czHePYX8VmeGgFN4HXu3q1yoqTnyggIefHpNfie
         SvIA==
X-Forwarded-Encrypted: i=1; AJvYcCW7sYMp08nt6qe9mWddQTQ2lsWqT4mJ71iWgALz4oVgEVM1GhEturW2QESZpa2Zo6ZO+Kj/1cOuyNqhqToBIWlFAs2Ylgx924/3
X-Gm-Message-State: AOJu0YxzU0nQ7Qjs8MTYEnsjAx8LmIZEgx7E1XaXfgIAdBgUrqvNQubk
	EZ9YT1Pmc6X3ePEBjH3pNBBW/kz+GJsXvQJoybE+E8EW98dDKnabjH+IkcAeeJrKKuN+UI+uAFv
	udY0fdTr7lV0CD+tDl+ov3wbmI8A=
X-Google-Smtp-Source: AGHT+IG6OxwJnPlRecfs0gLI9tl8froTvbIEsUoz11AIQoqRN2W4OAbu0Ma5H0uhfPLdp3GnATqEA7zPVA+NU+bUB6o=
X-Received: by 2002:a05:6512:6d3:b0:52e:a008:8f41 with SMTP id
 2adb3069b0e04-52eb99916damr62580e87.25.1720461191362; Mon, 08 Jul 2024
 10:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240703110624.1301830-1-wangrui@loongson.cn>
In-Reply-To: <20240703110624.1301830-1-wangrui@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jul 2024 19:52:44 +0200
Message-ID: <CANiq72m35W=8V77Rcu7MKw29EXEFq102tOL_Myyx1UvMuJYUBA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: rust: Use rustc option -Zdirect-access-external-data
To: WANG Rui <wangrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Xi Ruoyao <xry111@xry111.site>, Xuefeng Li <lixuefeng@loongson.cn>, loongarch@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 1:24=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrote=
:
>
> -Zdirect-access-external-data is a new Rust compiler option added
> in Rust 1.78, which we use to optimize the access of external data
> in the Linux kernel's Rust code. This patch modifies the Rust code
> in vmlinux to directly access externa data, using PC-REL instead of
> GOT. However, Rust code whithin modules is constrained by the PC-REL
> addressing range and is explicitly set to use an indirect method.
>
> Signed-off-by: WANG Rui <wangrui@loongson.cn>

I have created a tracking issue for this in
https://github.com/rust-lang/rust/issues/127488 since there was only
the MCP, I hope that helps.

I also added it to our #2 list of unstable features -- please feel
free to ping me in the future if you add others that you will need in
the kernel, I am happy to add the entry even before you send the patch
to the kernel in order to track things (in fact, even if it is not
implemented we can still track it in the other lists).

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
