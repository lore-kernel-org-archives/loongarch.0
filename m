Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414DD4D178A
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602992; cv=none; b=KQDAiGmJVbvwnv8WnMbugbj15FKetgBZkxl5BIy879b65ATeRVGxwQUWRMArMku33OcvmV5XSX+y+OzMe9uSpZxgU/8/BtLNrboZEuHQ4nunYbJisBrnpo51o8GA0fA9yAHEH0oppEpfx/F5fwIJTiRcIwn/RLDytEce1Px/TUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602992; c=relaxed/simple;
	bh=LAfG9aZjGdrhKCf/58E+Lupe9Ivg/F16AB6VzU/JCk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZ3Uo4pHOpfIVzQ6FukIlr6a8OU6AjqX2cuVfETkiKUHemPh9wt4eAzRe9vQx/d1BigysKpEeP37Q4VspsDpdQCV05qFSpuL+w3kGukwnVM9RgMK9YO+xqmvu0FjMAxgngX2n7g4vj2xtwJAaZIs+CRL+Pe/FjAsdYDF9yL/BBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqgwPDhN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqgwPDhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43AD1F00899
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790602988;
	bh=KhMGxUvRlRgkjraFBvxRRPukh6cwxdgVureX0v0+n4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XqgwPDhN/UCUkPF09xSf+JZzOnf+JLMeW+aF1DWSWGeSSdZjF0vTWKEoP/AZNss0x
	 h2sggBfT0YCdHVdVc5t7BYeqx6OLpqdhTjx3xECXnFs9ofzNp+LzrHGSGNUVKzjgxy
	 258QZwNIGi8BmRKb/Mt6XU4QHgD4uefN1BBXMmLtPMQenLPh2fc28zI5nOKnBDP6XJ
	 GMDWgbwE2Iq+42tslszYitegdOoW4H0bHHZzz1gCYD5U5xMlXELp0Z2mH/As4gfK+5
	 yroTVB5B+ukJzW/NA2d9lfFaXMoZLUD9J83TkGD8V/rG61Yhi7HuvX5tuI2G6rbVSO
	 SVNptfreJTUEA==
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so4467714a12.3
        for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 06:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWhy77Uvq/ovIMxViBZQlmjDuNv7yFhsXz6APbS8MfLXbIdPMNRjkmJm6UlwoDgl9twP6fW8Eaxfo=@lists.linux.dev
X-Gm-Message-State: AFq9FYL6km6k/KktN2t9i7ujhDIG2AJTgPGxzdNpJmuLgyDCoZvn6AnR
	MWOUGAD73E2zKyVBamG4C+p0CCTsPLkiaq1baytqYo3hI8eUMJo3LeT/ZeK8yqpURcvaFSJpCu7
	4cB4AyLweYEmTIXL7mbgQXcGME9FSm0U=
X-Received: by 2002:a05:6402:52d6:b0:6ac:9a44:d412 with SMTP id
 4fb4d7f45d1cf-6ac9a451421mr453774a12.7.1790602987498; Mon, 28 Sep 2026
 06:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923084802.29508-1-zhaoqunqin@163.com>
In-Reply-To: <20260923084802.29508-1-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 28 Sep 2026 21:42:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7+oXvoFbY1TDyRhYCgLXncRWNzpWrEBxpm6rwb_u8g5Q@mail.gmail.com>
X-Gm-Features: AclHuK9T9s7VHBe8CzWdrIsP39KtE45HD6piVqFEHQ4lotnnM54AAYzrWUKy_1w
Message-ID: <CAAhV-H7+oXvoFbY1TDyRhYCgLXncRWNzpWrEBxpm6rwb_u8g5Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] mfd: loongson-se: Add multi-node support and fix
 miscellaneous issues
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: lee@kernel.org, zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series,
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Sep 23, 2026 at 4:48=E2=80=AFPM Qunqin Zhao <zhaoqunqin@163.com> wr=
ote:
>
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>
> - Patch 1 introduces the multi-node platform support.
>
>   v6-v8: no changes
>   v5: Clear pending interrupts with S2LINT_CL before requesting IRQs,
>        and move S2LINT_EN to after all interrupt handlers are registered.
>   v4: Safely handling shared interrupt handler returns.
>   v3: Using shared interrupts (IRQF_SHARED) instead of manually
>       iterating through all devices to check for interrupts.
>
> - Patch 2 focuses on structural and error-path hardening for the
>   pre-existing baseline code. This includes resolving critical issues
>   discovered by the Sashiko Automation system such as: completion
>   race conditions, missing engine completion initialization, spinlock
>   held with interrupts disabled for up to 10 ms, EPROBE_DEFER
>   handling, DMA buffer overflow validation, interrupt cleanup on
>   probe failure, and device removal ordering.
>
>   v8:
>        - Remove the poll_lock added in v7
>
>   v7:
>        - Re-enable the interrupt under dev_lock in loongson_se_poll()
>          instead of poll_lock, so both the mask and re-enable of
>          SE_S2LINT_EN are protected by the same lock and cannot race
>        - Wait for controller command completion with a bounded
>          non-interruptible wait so a pending signal cannot leave the
>          controller running while DMA buffers are torn down
>        - Validate the id argument in loongson_se_init_engine() to
>          reject engine 0 and out-of-bounds indices
>        - Drop the redundant init_completion() in
>          loongson_se_init_engine() now that probe() initializes all
>          engine completions
>   v6:
>        - Mask the target interrupt, clear pending status, and
>          reinitialize the completion under dev_lock before issuing a
>          command, re-enabling the interrupt after triggering
>        - Keep the original engine_init_lock scope instead of the
>          broader cmd_lock mutex
>        - Reuse loongson_se_send_controller_cmd() in the STOP path and
>          register the stop handler before loongson_se_init()
>        - Correct the dmam_size validation formula
>   v5: Fix all issues reported by Sashiko analysis:
>        - Initialize engine completions in probe to avoid NULL deref
>        - Use cmd_lock mutex for command serialization, drop spin_lock_irq
>        - Add reinit_completion to controller and engine command paths
>        - Fix EPROBE_DEFER handling in platform_irq_count()
>        - Validate dmam_size against minimum required size
>        - Disable IRQs in probe error path after init failure
>        - Add loongson_se_stop() devres cleanup with proper ordering
>        - Use non-interruptible wait for STOP command
>   v4: new patch
>
> Qunqin Zhao (2):
>   mfd: loongson-se: Add multi-node support
>   mfd: loongson-se: Fix miscellaneous issues
>
>  drivers/mfd/loongson-se.c       | 119 ++++++++++++++++++++++++++++----
>  include/linux/mfd/loongson-se.h |   1 +
>  2 files changed, 106 insertions(+), 14 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.47.2
>
