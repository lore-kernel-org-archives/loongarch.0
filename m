Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3E4A205A
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999345; cv=none; b=mH4yUeJXNLKAvN0OATzZ3jf8s4VFee2JPa3RjYpRfHml16hSDdvXb3Hs5UI5YoVPTBfPGHipFI6OGdBLjtCqSArnaIi0oEpXafaRfp1/1CI+HIrta/3EAzAkrgiZoQeyV5iFkVQA4SSRbXyBZN050UASWNzK7r/dJNBmaco5h8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999345; c=relaxed/simple;
	bh=d9wqUJmpH5uLASKu/y+N22vJym4WyRByfBRA78L07L0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QV06o23M5b+2Bm+d47Wngx26Er2Ju9XUH1QujLqTYgZVIWfYCegEJLNyS1nRlERIJ9Lp5J8tUPH4zLOHj0olyPlOY4rLMzq/T6kv3eOXUTiBuGJGb7A334BtEhumiEJdqWOROnwdYnY9QNTYqx8OvgB/o0/N7J3c5b1d3eH2ej0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIIY4XmZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIIY4XmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4371F0089C
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999343;
	bh=FHCOo0228Ui6llFBqgoOKNDXI90TVjQN+WDSq4RM2V4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bIIY4XmZ0InIqvjL46Gzjedgt5Lv3velFSfRAngCeyWaKpRjsY2iF3T31Mc6MIClU
	 tMZtR4gPxPHQv1NqN8aYG5/OpVW7HvZY2BPF0sfC0oQJkbhhXfF0csssnaKxTW48QI
	 3A5hjfyLIJW+L1rrlf4rsnp0Sb4QxCbWW/cJzS/o/HZ/uLjI/izKwcZVm63Hf9e0tX
	 j1wHhl5w41dLgK2wKlWJx9nwXY0B4yA/3HOH3tIduBV5B9Ok9m5KdABybIOh6Pggkp
	 wLO82J9ehSFs2Z8cUsVpzJSNfqAfv2Kh0NFVjtqVXs5AuDZBnXOfQFxGpreqci/Vv2
	 CddaR6b2oYswA==
Received: by mail-ua2-f30.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed1so1736425241.1
        for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 07:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+ZJ5bGIp/JoeqRAOmV9gUbC9Ta4HRTFj4V9DW/Ft+uVap8CQE8KtSgavxhvg1NKRWA7YpxhmJTfY=@lists.linux.dev
X-Gm-Message-State: AFuF++kXvS0p5ylvgfPkxCnFHKoAZ7CoJrs4DpmoEkPJUN28RIc+U3AI
	gf/cDYTpsrX0kv2Jzpy8gWDqkuGGER4dlfqvbk94sfqVnhF3nUKRBrssIAdkgyL7x4rcSg8yUTz
	Y6Y714N1pGcL78M4NXKJwxXSQlICxQe0=
X-Received: by 2002:a05:6122:3106:b0:5c9:c60e:5cf4 with SMTP id
 71dfb90a1353d-5c9c60e60efmr3123384e0c.18.1789999342617; Mon, 21 Sep 2026
 07:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920022659.3145724-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260920022659.3145724-1-peng.fan@oss.nxp.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:02:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7N7d_FTE9FT8cR-ONar+DkGtYN8KbxuMmDSw8xZbY=+g@mail.gmail.com>
X-Gm-Features: AcwNN1XbrtOjyAjk34lMhPRdk74NuYmtXDM7SIXKrX-neV2ZyPTLfYjVkINbpsY
Message-ID: <CAAhV-H7N7d_FTE9FT8cR-ONar+DkGtYN8KbxuMmDSw8xZbY=+g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peng Fan <peng.fan@nxp.com>, Li Jun <lijun01@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sun, Sep 20, 2026 at 10:29=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/loongarch/kernel/env.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 652456768b55..c529a14deb18 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -25,10 +25,7 @@ void __init init_environ(void)
>         int efi_boot =3D fw_arg0;
>         char *cmdline =3D early_memremap_ro(fw_arg1, COMMAND_LINE_SIZE);
>
> -       if (efi_boot)
> -               set_bit(EFI_BOOT, &efi.flags);
> -       else
> -               clear_bit(EFI_BOOT, &efi.flags);
> +       assign_bit(EFI_BOOT, &efi.flags, efi_boot);
>
>         strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
>         strscpy(init_command_line, cmdline, COMMAND_LINE_SIZE);
> --
> 2.51.0
>
