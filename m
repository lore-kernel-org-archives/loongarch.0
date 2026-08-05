Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3B3B42C2
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895711; cv=pass; b=j/x3roCVe+HyHRL8XzBT1ghY+UXbyDxGkXkdJlfiCQ1zsambsCaJ1AXA34IO+ibmFYKab7EXpsV7eSgRYJ4C1lvJQP6VmQ3NNZG5Ca/Fjyjqzxyqg5gEUZB2iDag0KP+VSiR5rMK8NKW9rv0VgOQSvSOQx+5tJJeEvTJzvcOUJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895711; c=relaxed/simple;
	bh=UBrIoFn2KHvQ2srfH9Cda31RItNTXxlXadl9iHhPyaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOKEntRC70Kv6ows5n4v1gzJZ7dl7MWf7nsZBB55I+sSJ2TkHQv66Zht+MO8/l5f/7qyihrPyChSjmpqV4STCQ/GSFGNASOwWOSybE+EjNESzeLISTcnejz2rTr8dyfL//Im4asLEtP48OWl1uPoDVXNYJnSDqi2W/gpd9naZrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVJblc1V; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVJblc1V"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-448de0cc236so276138fac.2
        for <loongarch@lists.linux.dev>; Tue, 04 Aug 2026 19:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785895705; cv=none;
        d=google.com; s=arc-20260327;
        b=C9k+NyaOUvy0fRwZtx5D45LLFkZsamaVFDyhm1V/PWRYDUrQgSfX5AV1FUJ1TgL+FX
         qJlvougXwoNMEqEZ2ebFXTuUarM87je2IVe6jiq8j0a3I89xPDq58AyGMtuAdO9c9aat
         P+yUpxhOMX+VP4eycNxj2ajogIFLQlkOqSOGIpsObnbir+L4+FB+FXtXjRtZNvImAAqe
         pE+jxyUAsWVp9aIJ52WYMK8ZeqcQwihFNaZIB8PTD6gZUwzrBsS1YFQhSunrSJ5EyPzn
         2cVixefSeUqmZWBcKNF8XxU3uGY1stnyQdEQPKYkFmdVRteQhw26vwziJM0BBnriXkj5
         8+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qn5iscN2QzF14sWFnednaGYMEJaac78X8NTKeF5v3NY=;
        fh=5oNO1kNKsMjmPShsWRLRpFKBjdg1TeSYJdhw773wgaE=;
        b=fHhRsSdMv6TKsbcRO4NzDfBru217q30/soWC9XLlI3bGsNfwwoPxqdEoatzWDgECTs
         2c4xmE+EkISxIfbxxgFXgB7x/oYd0CRah0Jk2/UYi3ZAwY7p21BOYfNoFcqhFkkphkVb
         K9wo7/WY+RyAvbLwN6dr75OcOEod7tk8MnJvmz0MebHaVzcaDkZ/zLpJKwKCcVVzKiEJ
         dwfl0Myx9pgOwnvIhxncF/yZ0tOFYHIRfywQL9RgHDVTuTn9HSMiLZXOy2h99CIGZysk
         C9RIf2KOwnz777wfKyUkxPFCeIO7zGmsWE0km/diXF31QRYQp69WeCmZ5+WP4xQYuoDs
         Dvtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785895705; x=1786500505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qn5iscN2QzF14sWFnednaGYMEJaac78X8NTKeF5v3NY=;
        b=hVJblc1V97B0Z0seDlD9e0KE71ddQKGUMfXTlR9bhhjvpaAGLdErFXqSPR5SFiFYUf
         rvVJzZWQBubgSHGoIIyLinbI/LuQRt2MjquLxIT4ulOazNYz8DPBCn061lncRDgK/LCZ
         ircVhY7JIGmoIyABKisRj17PtnEZV5wWuVTlj8L3gpRAbi5c4sqY9Uqa84n9Ntb/xAXP
         GjLcbjpA5qwUfMEqfZ0Kv3lUjSYeYNIArapKZMPf2pCx5mKHpcw7FWsNoY8UohRqWtgK
         wQHAh9Ne6GijXpIII2pPjeR2xyRmH+EttTeTnn/sIU75dNCmDt7IgxmsqokujThHYn9t
         gz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895705; x=1786500505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qn5iscN2QzF14sWFnednaGYMEJaac78X8NTKeF5v3NY=;
        b=CV0J/iAYUqt2xEaM/odRJyQa4nvxxoFrJfhSTe68lSI/r69GiIyTOtI6StEIInJVxy
         qgKtfyyHNKlZ1ehs0l0t+YRRsezrmukZ5pJCYNu7VH2KNj5J12fQFz+fX8XImcEBdHUe
         I4zjeF7PL8Ru8EsXWXhOwQSluDVmgWxWYv7ffx2YqhPmFIEb1GoJxMRJJKAztMaHNnzK
         gOqY8eyha65WVVCfQwzDr6NI/mS84MeyDBnsk8obC1HDdnIkg0w0N6iDdBqBsB6+5mub
         PcOdFnmGQBvIsUvzvnWaJfgITJxvj+6PFVFGe0GWtDxLsOexHFGAsumChNsHxt4c/Axl
         WkYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGDQVI3Mh7gEJy1GBMQbb0pJbR2QJErRcx9n/w1/qCtzu3e/OfdX9EWdZaZQsuyXy0n0aBH54H58I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz4sP+XtI8f5EiKWP94KlqL5Rz4PpR2OMj684dUB5tDmdST9bJ
	coeg8p+jRRZH2bwLAXy3FP16LiXyX4Tw3Ie548h4aL9ffCst4x+yqOsxi+bYZK8rhiCGbyza5+p
	dfudfelsxlVqhDwwXkGUpccwcSMrwxrI=
X-Gm-Gg: AR+sD12UwK2KfbwUJGBtkXvoxJV00leZ23GIip3mxgbAmCSiDinuTDoyNSNCNqBv48F
	3fkAqzBtosMa/K/YPdC7DvcgfDl4TjBeDzdDHbyN4cFEdrNgNbeZ7gc8aIDHVf7bOLCg8fawV6/
	dyeexhDxIbgkar7q644BRP1kuccoK7Td9Q7abGZzqYZP7IDLyVFRZV3ihxmzSZn2FR8toj90jDG
	QgffPSfefd8PNyDf4Hir3TmXEPZFZFo3cMMmiIMI7jbSfasUjddlpulkd8REeewzQDYvheZVSbc
	m7TVVGjMXzHgrySfstLKEa2MzAMEleoArKd+FX/r0QQtBQ==
X-Received: by 2002:a05:6871:203:b0:441:419:1fea with SMTP id
 586e51a60fabf-4599eda5245mr1938698fac.11.1785895705149; Tue, 04 Aug 2026
 19:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729022837.355549-1-chenguang.zhao@linux.dev> <20260729022837.355549-3-chenguang.zhao@linux.dev>
In-Reply-To: <20260729022837.355549-3-chenguang.zhao@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 5 Aug 2026 10:08:13 +0800
X-Gm-Features: AUfX_mzHgPzDCakbKSrKYJB9sJhoZ-nbaukmlgfyfjPz1JQxAsT9iKnGf1YwrHs
Message-ID: <CAEyhmHQOGZGJbdx21mBtZ7aNM8ZDnYTgCtLWHQ4pXy3jVcG3Ng@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] LoongArch: bpf: Advertise JIT support for kptr
 xchg inline
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:30=E2=80=AFAM Chenguang Zhao
<chenguang.zhao@linux.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> The BPF verifier can lower bpf_kptr_xchg() to BPF_XCHG when the JIT
> advertises ptr xchg support. With ordered amswap_db.* emission from the
> previous patch, declare that LoongArch bpf JIT supports this inlining.
>

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 5417a5624327..686d333146ce 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -2396,6 +2396,11 @@ bool bpf_jit_supports_fsession(void)
>         return true;
>  }
>
> +bool bpf_jit_supports_ptr_xchg(void)
> +{
> +       return true;
> +}
> +
>  /* Indicate the JIT backend supports mixing bpf2bpf and tailcalls. */
>  bool bpf_jit_supports_subprog_tailcalls(void)
>  {
> --
> 2.25.1
>
