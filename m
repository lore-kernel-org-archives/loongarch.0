Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BCCA6A
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692964761; x=1724500761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYa2rmbVibTTzJA1qhXhwMJJgoIx8FJOzgkA0XkdUoI=;
  b=oCQOse2TP78i4LjIBv5na2RFo6SE9N7C4nLkqlbWYAXkXFo3TUAJDaeS
   4Fs3CX4Uv5BvZcdpcah2ewRyNDhYorA6BFtk2WkdeakEeSUyiqm1nxcbs
   i2KQsh0RfEOC45RqrAeEGfcdmZiNhiHHwkKZnuV7CeAWDdJrf0BMiOaWc
   +pZuWmWliNLqzsVejm6OgeHJ31zJy+kZZaq9mAXSHui9NlKiTIn132LEF
   Bp3BQqW9fS7ia1W238JxjxFb9RyHAqg6R39QN6x38iNT+dNqOLpkZpjwG
   Rw7N/qmsMKomU7b+qaQufIOcTImc9coOBaFZgI+OorM6rJNC46BRgbJCL
   w==;
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="asc'?scan'208";a="231707760"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2023 04:59:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 25 Aug 2023 04:58:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 25 Aug 2023 04:58:28 -0700
Date: Fri, 25 Aug 2023 12:57:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Huacai Chen <chenhuacai@kernel.org>
CC: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
	<zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <loongson-kernel@lists.loongnix.cn>, Xuerui
 Wang <kernel@xen0n.name>, <loongarch@lists.linux.dev>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v4 0/7] LoongArch: Add built-in dtb support
Message-ID: <20230825-doubling-waltz-6444e26152db@wendy>
References: <cover.1692783907.git.zhoubinbin@loongson.cn>
 <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R5RCBxfpk++k8id+"
Content-Disposition: inline
In-Reply-To: <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>

--R5RCBxfpk++k8id+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 07:38:31PM +0800, Huacai Chen wrote:
> This series looks good enough to me now, if no one has objections, I
> will queue it to loongarch-next.

Have you not read Rob's replies?

--R5RCBxfpk++k8id+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOiXOwAKCRB4tDGHoIJi
0oioAQC9seDAPhpBfYC7+N1in3TS0o5zdeEk2mw4b3K/ssqF+QEA2FP8m2uGc2Dq
K0SUjJOOl8j5/YcevMEjOmMFb8O7QAM=
=x241
-----END PGP SIGNATURE-----

--R5RCBxfpk++k8id+--
