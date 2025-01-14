Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C671C3BE1;
	Tue, 14 Jan 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843375; cv=none; b=eYUt/r2/KsONp1N+m407Pf0nsaDH0wg/mCZ5qGqqRgBcFTu5wr5B2yO1lXVbRA1ZOZQKjc8+p36iGmMOBby+qrWRBNJ4WxYS2UrdFuYnvhezjrBqeZ4Ub/LGxAJdKN9Yha6dN6cDuM5O5CbvkvD2qNQPdw1ytkV/EW5eq22eEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843375; c=relaxed/simple;
	bh=REF9R0/AevOC88vpAVmwrLFvgdfE9O7rW7bMxSbbx30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhK/lSPxHL6H7DwiAPJijxz5wOZm74e4baIGEi8fc6v5jIixcqX0WHCs5yMOM9F9az1RsPR+kuDdkQfSSYYAe2U6bBDLltDsOgbMpVXcS5lLWDSkXee+gWhF0TmoruB4Mb2soxG1f4pCdSg+4VnCZCd+acNaccjkgIV0QGLg6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tk4XIAH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tk4XIAH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10F7C4CEE4;
	Tue, 14 Jan 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736843374;
	bh=REF9R0/AevOC88vpAVmwrLFvgdfE9O7rW7bMxSbbx30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tk4XIAH7IZgpIBLlaekTk1hbT0dhIR5JjNKx41xyrQTJ1pYG655vBU/sIvP87LqFa
	 wNn0IeuvVWmEIoLigNlbFbEM9D1JIKcYT0tf4jBFwj4MmEiRisbb9ygw0jXJ1fyaPu
	 TSUZswP6oaS7qSi5NBdIhkIsCpJxSOoRAX8sOIpWwdDJCzbi+3eaSh1DqPyg7+6OKx
	 s/zQ9Y12XNCuN8ggIdF7oC8WG1UDfcDXceSMrdS1sG11mp7czKcTr521QmJDpEEZfR
	 l1b6zdBzLx8BbFzN7dZ0p63co2ka7AqJB19VK88c8o582xD+uX7OLC4hy6R3CBPkaR
	 /oAXkO6nxQCpg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa689a37dd4so991634766b.3;
        Tue, 14 Jan 2025 00:29:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIoegypjDFJoEWrn3+xaIytUwoUnOlZlAgnXCgWXx0bL73Sne1ne5A1JU7hbAwzojTxQkJT9QErnfM@lists.linux.dev, AJvYcCXUNQ1Re8YNBLhBkA2MldU8GgT2Uyk3S0STymI+B4ynagWePv3WCJeHMh2c28gsRyq/n2ej@lists.linux.dev
X-Gm-Message-State: AOJu0YymCjffyhTbSebZ/TJcyImlg8SApPeWOTh3r/5ea5OVhomS96MJ
	+csZsEZakSQb2Zb5YJocSMb5wrQzXkqnRTcV3l9fNrMtJSdEHwPyaNrmuQZA9Y6r5GKyAiuDguw
	BnLA/FUSebqha6XhiciruJyVlXWk=
X-Google-Smtp-Source: AGHT+IElAq3lQGfS+6xEcOQVKwEqVXcMg90XZRj94kUn+TNlDOrojK6m2DR1Q6qZBQph+Trg27dHVUPe59et5X83iTQ=
X-Received: by 2002:a17:907:7fa7:b0:aa6:423c:8514 with SMTP id
 a640c23a62f3a-ab2abc94ef2mr2078085666b.40.1736843373373; Tue, 14 Jan 2025
 00:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114061507.30765-1-yangtiezhu@loongson.cn> <20250114061557.31120-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250114061557.31120-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 14 Jan 2025 16:29:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H56-xQm5XnS7M4weHj29Z_bB8ZBiF_H4fd+eGe6g+naow@mail.gmail.com>
X-Gm-Features: AbW1kvaQU7lxQPgzhBYhzMIR21QncIr3ZMwrvDUj3OeU5jbc3RfcolKwA9Diink
Message-ID: <CAAhV-H56-xQm5XnS7M4weHj29Z_bB8ZBiF_H4fd+eGe6g+naow@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add ASSERT_BUG() macro definition
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, Jan 14, 2025 at 2:16=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> In order to keep the current ability for the aim of debugging and avoid
> printing the warning message twice, add ASSERT_BUG() macro definition to
> harden the callers of division functions.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/os_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/=
amd/display/dc/os_types.h
> index f2ba76c1e0c0..932bbe05ee0a 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -79,6 +79,11 @@
>                         dc_breakpoint();        \
>         } while (0)
>
> +#define ASSERT_BUG(expr) do {                  \
> +               dc_breakpoint();                \
> +               BUG_ON(!(expr));                \
> +       } while (0)
I don't think this is correct, if KGDB is enabled, then whether expr
is true or false, ASSERT_BUG() will break to KGDB.

Huacai

> +
>  #define BREAK_TO_DEBUGGER() \
>         do { \
>                 DRM_DEBUG_DRIVER("%s():%d\n", __func__, __LINE__); \
> --
> 2.42.0
>
>
