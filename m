Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779113;
	b=Rdb3+y8idKV1i6TWS9QY2TfxA+IPLfIJT41Cql7bJzzLBydAigWwbYyQ+I/boAHuR0b4
	 ba0MvHTY0FH0EtpEeclaT7odqXkKiDtWeCNBQWPa9ZAJis/Rjtmkdpq7PP8gViXw8o88n
	 vFDPEWTxbydxMrLHeqIa1G5mrS0oYCXttNF9u2vmLifhy+R7eiJ9XyVdCPGIGcr+7972x
	 yiPkVfkvE/qHuCGB5qJogHmYWGh4Pe3zdqoHB8JyT3QtCtGtV7nC6m0wksELs8+sa0DkQ
	 pFqpVHEVv4ZvZSFCQQIpJA48yQqr2/2rpc/wlFPbKXgdnLQWEQJ5Vtjh9G51pxWNBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779113;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yzs3TvTUyCNgvkC1v8i5/KukWGuWF2PDxlQsJeMPHXU=;
	b=Cg+/deMJFenZjw4qlWTWawA8jMRFH3+qPfUEIjlTBG/vWUlwVhmRpuN8iVHmXboM3pzt
	 bU7TqgWyQvi6kdgNY33VoTpPaLS+XzisujBy1JYEwfZE0rSeqHotl6RoGe8cNvKK1Ssg2
	 Bzy2WHRq3TV11ReebSjers0IcEHbRlotkl3/4Svrsq58/7+xhe9uqffyXUDR9h5Wg/ULZ
	 1S6IuPcoVvDVUpz3dno5XAubSmxSdSu5L6EcOYJ2QzHUUfbcKPxWjq2LTSB/q+02dDzHN
	 WqOoBSuptuIBfGwa78+BDo91Qvd7w46yds0Wn+M/EM/RC392H9FCQo9mZdONoSgNBPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APD3QMfW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A6606A326
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APD3QMfW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B1B1F00A1D
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779112;
	bh=Yzs3TvTUyCNgvkC1v8i5/KukWGuWF2PDxlQsJeMPHXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=APD3QMfWSKD1BEqDuFPXE3+ohbtpJ6xbOkKF6/O6IX/sFmf/WP6tCTDPkk7Blzesk
	 9AEVKiwcntw99HFpLfc/vRRK6t0gNxTIHcHq6gE7VkH0GGGP9gA6kD74UuMoPnvQ0d
	 aeM08aciNUWSsTLf6qfTtyp8IerYG5yHTVghZ8eNRM61BcV9BHFMi22/mNmPB4rybU
	 KF5Nvz87trX80hDjstvXlqRP/RjVqVM6sTq+llZVdRujHeg3C+ozXR41e2+7gr+L2C
	 Kwjz4N1LwdZIcYXIK4HaVufFg8C/SwduBh5RJqtnmLsAfz/WtWsIWMBcNzUdGkFzHC
	 5L2yR8fY5rTXA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso463533a12.0
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 23:58:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByFS9b+iKvf/4AlBy78Ro7WSEU+OW8KPQAuLzpeiyDUhLO7tWl3o0ufzrtt6XEBIENgALV8TYgIK6I=@lists.linux.dev
X-Gm-Message-State: APuU4Z/0f1MGjduF0lZ9IjsHQiKnflepw0WSZDy6SB4rsylOgsHSsVFL
	4e6wOpfDt3NwE3q/jjOC7m61dM8+NCupfcJhVHOM3xUnwvtSCPWIjjgvpu2DkDcdoANSnZzboxS
	b+eH7RMtpNCJRBRaHYwTGILg+Z42mGac=
X-Received: by 2002:a05:6402:4608:b0:6b3:dd6e:3dca with SMTP id
 4fb4d7f45d1cf-6b4d4d82589mr10723248a12.28.1793779111329; Tue, 03 Nov 2026
 23:58:31 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793776192.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1793776192.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Nov 2026 15:58:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5xomk3dwDScquwWWCD3_FCoJG8dur0b09j68QUqPT3VQ@mail.gmail.com>
X-Gm-Features: AclHuK9cpjirvuwWJw1GRdeY1qyvEyu7MaMSjIH4ln9noIFTiQtqfBK6yL3oNPQ
Message-ID: <CAAhV-H5xomk3dwDScquwWWCD3_FCoJG8dur0b09j68QUqPT3VQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] serial: 8250: Add Loongson-2K0300 and Loongson-2K3000
 UART support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Haowei Zheng <zhenghaowei@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this series:

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Nov 4, 2026 at 3:46=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This series adds UART support for two Loongson SoCs.
>
> The Loongson-2K0300 UART is the same as the one found on the
> Loongson-2K1500, so it is documented as falling back to
> "loongson,ls2k1500-uart" and then "ns16550a". No driver changes are
> needed.
>
> The Loongson-2K3000 UART differs from earlier Loongson UARTs in that it
> does not require MCR/MSR signal inversion. It also supports a fractional
> baud rate divisor. A dedicated compatible and driver data are added so
> the driver can distinguish it.
>
> Thanks.
> Binbin
>
> Binbin Zhou (3):
>   dt-bindings: serial: 8250: Document Loongson-2K0300 UART compatible
>   dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART
>     compatible
>   serial: 8250_loongson: Add Loongson-2K3000 UART support
>
>  Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
>  drivers/tty/serial/8250/8250_loongson.c            | 7 +++++++
>  2 files changed, 11 insertions(+)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.52.0
>
